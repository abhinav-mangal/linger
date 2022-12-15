part of 'product_view_cubit.dart';

class ProductViewState extends Equatable {
  final ShopProduct shopProduct;
  final bool processing;
  final bool isLiked;
  final bool isOnCart;

  const ProductViewState(
      {required this.isLiked, required this.isOnCart, required this.processing, required this.shopProduct});
  const ProductViewState.initial(
      {required this.isLiked, required this.isOnCart, required this.processing, required this.shopProduct});

  ProductViewState copyWith({
    ShopProduct? shopProduct,
    bool? processing,
    bool? isLiked,
    bool? isOnCart,
  }) {
    return ProductViewState(
      shopProduct: shopProduct ?? this.shopProduct,
      processing: processing ?? this.processing,
      isLiked: isLiked ?? this.isLiked,
      isOnCart: isOnCart ?? this.isOnCart,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        shopProduct,
        processing,
        isLiked,
        isOnCart,
      ];
}
