import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/app/app_provider.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/shope/cubit/product_detail_view_cubit.dart';
import 'package:linger/ui/shope/product_detail_screen.dart';
import '../../../cubits/shop/shop_cubit.dart';
import '../../../data/model/my_cart/cart.dart';

class CartViewCubit extends Cubit<CartViewState> {
  CartViewCubit(this.cart)
      : super(CartViewState.init(
          cart: cart,
          discountPrice: cart.discountprice?.toDouble() ?? 0.0,
          productQTY: cart.quantity?.toDouble() ?? 0,
          salePrice: cart.saleprice?.toDouble() ?? 0,
        ));
  final Cart cart;
  final route = getItInjector<AppRouter>();
  onIncreaseTap(BuildContext context) {
    onIncreaseDecreaseItem(context, state.cart.productId ?? 0, '1');
  }

  onDecreaseTap(BuildContext context) {
    if (state.productQTY != 0) {}
    onIncreaseDecreaseItem(context, state.cart.productId ?? 0, '0');
  }

  Future<ShopProduct> getShopProduct(int id, List<ShopProduct>? product) async {
    return product!.where((element) => (element.id) == (id)).first;
  }

  onRemoveTap(BuildContext context, List<ShopProduct>? product) async {
    // late final ProductDetailVewCubit productDetailVewCubit;

    // ShopProduct productById =
    //     await getShopProduct(state.cart.productId!, product);
    // ProductDetailScreen.newInstance(
    //   state.cart.productId.toString(),
    //   productById,
    // );
    // productDetailVewCubit = context.read<ProductDetailVewCubit>();
    // productDetailVewCubit.getProductDetail(state.cart.productId.toString());
    // onIncreaseDecreaseItem(context, state.cart.productId ?? 0, '3');

    context.read<ShopCubit>().onRemoveTap(
          context,
          productId: state.cart.productId!,
          // status: status,
        );
  }

  onIncreaseDecreaseItem(BuildContext context, int productId, String status) {
    context.read<ShopCubit>().addRemoveCartItem(
          context,
          productId: productId,
          status: status,
        );
  }
}

class CartViewState extends Equatable {
  final Cart cart;
  final double salePrice;
  final double discountPrice;
  final double productQTY;

  const CartViewState({
    required this.cart,
    required this.discountPrice,
    required this.productQTY,
    required this.salePrice,
  });

  const CartViewState.init({
    required this.cart,
    required this.discountPrice,
    required this.productQTY,
    required this.salePrice,
  });

  CartViewState copyWith({
    Cart? cart,
    double? salePrice,
    double? discountPrice,
    double? productQTY,
  }) {
    return CartViewState(
      cart: cart ?? this.cart,
      discountPrice: discountPrice ?? this.discountPrice,
      productQTY: productQTY ?? this.productQTY,
      salePrice: salePrice ?? this.salePrice,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        cart,
        discountPrice,
        productQTY,
        salePrice,
      ];
}
