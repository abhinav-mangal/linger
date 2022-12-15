import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/router/app_routes.gr.dart';
import '../../../Utils/flushbar_notification.dart';
import '../../../Utils/progress_utility.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';
import '../../../data/data_repository/app_repository.dart';
import '../../../locator.dart';
part 'product_view_state.dart';

class ProductViewCubit extends Cubit<ProductViewState> {
  ProductViewCubit({
    required this.product,
    required this.onProductUpdate,
  }) : super(ProductViewState.initial(
            shopProduct: product,
            processing: false,
            isOnCart: false,
            isLiked: false));

  final ShopProduct product;
  final Function(ShopProduct product) onProductUpdate;

  final dataRepo = getItInjector<AppRepository>();
  final route = getItInjector<AppRouter>();
  String? myToken;
  ShopCubit? shopCubitInstance;

  void init() {
    final authCubit = route.navigatorKey.currentContext!.read<ProfileCubit>();
    final cartCubit = route.navigatorKey.currentContext!.read<ShopCubit>();
    shopCubitInstance = cartCubit;
    myToken = authCubit.state.user?.token ?? '';
    final bool isLiked = product.likeStatus.toString() == '1';
    bool? isOnCart;

    if (cartCubit.state.myCart != null &&
        cartCubit.state.myCart!.data != null &&
        cartCubit.state.myCart!.data!.cart != null) {
      if (cartCubit.state.myCart!.data!.cart!
          .any((element) => element.productId == product.id)) {
        isOnCart = true;
      } else {
        isOnCart = false;
      }
    }

    emit(state.copyWith(
      isLiked: isLiked,
      isOnCart: isOnCart,
    ));
  }

  Future<bool?> likeDislikeProduct(BuildContext context) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);
    final response = await dataRepo.likeProducts(
      token: myToken ?? '',
      productId: product.id.toString(),
      status: state.isLiked ? '0' : '1',
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
      final bool isLiked = !state.isLiked;
      final product = state.shopProduct
          .copyWith(likeStatus: _getLikeState(r?.data), isLiked: isLiked);
      onUpdateProduct(product);
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
}
