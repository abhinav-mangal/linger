part of 'product_detail_view_cubit.dart';

class ProductDetailViewState extends Equatable {
  final ShopProduct shopProduct;
  final bool processing;
  final bool loading;
  final bool isLiked;
  final bool isOnCart;

  ///PRODUCT DETAIL DATA
  final ProductDetailModel? productDetailModel;

  const ProductDetailViewState(
      {required this.isLiked,
      required this.loading,
      this.productDetailModel,
      required this.isOnCart,
      required this.processing,
      required this.shopProduct});
  const ProductDetailViewState.initial(
      {required this.isLiked,
      required this.loading,
      this.productDetailModel,
      required this.isOnCart,
      required this.processing,
      required this.shopProduct});

  ProductDetailViewState copyWith({
    ShopProduct? shopProduct,
    bool? processing,
    bool? loading,
    bool? isLiked,
    bool? isOnCart,
    ProductDetailModel? productDetailModel,
  }) {
    return ProductDetailViewState(
      shopProduct: shopProduct ?? this.shopProduct,
      processing: processing ?? this.processing,
      isLiked: isLiked ?? this.isLiked,
      isOnCart: isOnCart ?? this.isOnCart,
      productDetailModel: productDetailModel ?? this.productDetailModel,
      loading: loading ?? this.loading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        shopProduct,
        processing,
        isLiked,
        isOnCart,
        productDetailModel,
        loading,
      ];
}
