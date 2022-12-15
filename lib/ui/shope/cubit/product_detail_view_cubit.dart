import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/product_detail_model/data.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/router/app_routes.gr.dart';
import '../../../Utils/flushbar_notification.dart';
import '../../../Utils/progress_utility.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';
import '../../../data/data_repository/app_repository.dart';
import '../../../data/model/product_detail_model/product_detail_model.dart';
import '../../../locator.dart';
import '../../../data/model/shop_dashboard_model/shop_product.dart';

part 'product_detail_view_state.dart';

class ProductDetailVewCubit extends Cubit<ProductDetailViewState> {
  ProductDetailVewCubit({
    required this.shopProduct,
    required this.onProductUpdate,
  }) : super(ProductDetailViewState.initial(
            loading: false,
            processing: false,
            isOnCart: false,
            isLiked: false,
            shopProduct: shopProduct));

  final Function(ShopProduct product) onProductUpdate;

  final ShopProduct shopProduct;

  final dataRepo = getItInjector<AppRepository>();
  String? myToken;

  final route = getItInjector<AppRouter>();

  void init(String productId) {
    final authCubit = route.navigatorKey.currentContext!.read<ProfileCubit>();
    myToken = authCubit.state.user?.token ?? '';
    getProductDetail(productId);
  }

  Future<void> getProductDetail(String productId) async {
    emit(state.copyWith(
      loading: true,
    ));
    emit(state.copyWith(
      isLiked: state.shopProduct.isLiked,
    ));
    final res = await dataRepo.getProductDetails(
      token: myToken ?? '',
      productId: productId,
    );

    emit(state.copyWith(
      loading: false,
    ));

    res.fold((l) {}, (r) {
      if (r != null && r.data != null) {
        emit(state.copyWith(
          productDetailModel: r,
        ));
        setData(r.data!);
      }
    });
  }

  void setData(ProductDetailData productDetailData) {
    if (productDetailData != null &&
        productDetailData.product != null &&
        productDetailData.product!.isNotEmpty) {
      final product = productDetailData.product!.first;
      final cartCubit = route.navigatorKey.currentContext!.read<ShopCubit>();

      if (cartCubit.state.myCart != null &&
          cartCubit.state.myCart!.data != null &&
          cartCubit.state.myCart!.data!.cart != null) {
        final bool isOnCart = cartCubit.state.myCart!.data!.cart!
            .any((element) => element.productId == product.id);
        emit(state.copyWith(
          isLiked: product.isLiked,
          isOnCart: isOnCart,
          shopProduct: product,
        ));
      }
    } else {
      final product = state.shopProduct;
      final cartCubit = route.navigatorKey.currentContext!.read<ShopCubit>();
      if (cartCubit.state.myCart != null &&
          cartCubit.state.myCart!.data != null &&
          cartCubit.state.myCart!.data!.cart != null) {
        final bool isOnCart = cartCubit.state.myCart!.data!.cart!
            .any((element) => element.productId == product.id);
        emit(state.copyWith(
          isLiked: product.isLiked,
          isOnCart: isOnCart,
          shopProduct: product,
        ));
      }
    }
  }

  Future<bool?> likeDislikeProduct(BuildContext context) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);
    final response = await dataRepo.likeProducts(
      token: myToken ?? '',
      productId: state.shopProduct.id.toString(),
      status: state.shopProduct.isLiked ? '0' : '1',
    );
    ProgressUtil.hideProgress();
    emit(state.copyWith(
      processing: false,
    ));
    response.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to like product');
      return false;
    }, (r) {
      final product = state.shopProduct.copyWith(
        likeStatus: _getLikeState(r?.data),
        isLiked: !state.shopProduct.isLiked,
      );
      // final bool isLiked = !state.productDetailModel!.data!.product!.first.isLiked;
      final bool isLiked = !state.shopProduct.isLiked;
      if (product != null) {
        onUpdateProduct(product);
      }
      final shopCubit = route.navigatorKey.currentContext!.read<ShopCubit>();

      shopCubit.getShopData();
      emit(state.copyWith(
        isLiked: isLiked,
      ));
      shopCubit.getMyFavorites();
      return true;
    });
    return null;
  }

  void onUpdateProduct(ShopProduct product) {
    emit(state.copyWith(
      shopProduct: product,
    ));
    onProductUpdate(product);
  }

  int? _getLikeState(dynamic data) {
    try {
      return data as int;
    } catch (e) {
      if (kDebugMode) {
        print('exception- $e');
      }
      return 0;
    }
  }

  Future<void> updateProductCartStatus() async {
    await getProductDetail(state.shopProduct.id.toString());
  }
}
