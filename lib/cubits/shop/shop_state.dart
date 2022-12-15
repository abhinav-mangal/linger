part of 'shop_cubit.dart';

class ShopState extends Equatable {
  final ShopDashboardModel? shopDashboardModel;
  final List<Slider>? slider;
  final List<Category>? category;
  final List<ShopProduct>? flashSaleProduct;
  final ShopBannerModel? banner;
  final List<ShopProduct>? popularProduct;
  final List<ShopProduct>? mostLikeProduct;
  final List<Article>? article;
  final bool? loading;
  final bool? processing;

  ///my cart data
  final MyCart? myCart;
  final List<Cart>? cart;
  final int? total;

  ///review data
  final Reviews? reviews;

  ///order data
  final OrderDetailModel? orderDetailModel;
  final MyOrder? myOrder;
  final Morder? order;
  final MyOrderAddress? myOrderAddress;
  final OrderSummaryModel? orderSummaryModel;

  ///categories products
  final Products? categoriesProducts;
  final List<Category>? productsCategory;
  final List<Subcategorie>? productsSubCategory;
  final List<ShopProduct>? products;
  final int currentCategoryIndex;

  /// favorite products
  final List<ShopProduct>? favoriteProducts;

  /// fashion products
  final List<ShopProduct>? fashionProducts;
  final List<ShopProduct>? healthyDiet;
  final List<ShopProduct>? proMuslims;
  final List<ShopProduct>? crafts;
  final List<ShopProduct>? mostSoldItems;
  final ListFlProduct? seeAllproducts;

  final List<SavedPaymentMethods>? paymentMethods;

  const ShopState(
      {this.orderSummaryModel,
      required this.currentCategoryIndex,
      this.fashionProducts,
      this.healthyDiet,
      this.proMuslims,
      this.crafts,
      this.mostSoldItems,
      this.favoriteProducts,
      this.categoriesProducts,
      this.productsCategory,
      this.productsSubCategory,
      this.products,
      this.shopDashboardModel,
      this.slider,
      this.category,
      this.flashSaleProduct,
      this.banner,
      this.popularProduct,
      this.mostLikeProduct,
      this.article,
      this.loading,
      this.processing,
      this.myCart,
      this.cart,
      this.total,
      this.reviews,
      this.orderDetailModel,
      this.myOrder,
      this.order,
      this.myOrderAddress,
      this.seeAllproducts,
      this.paymentMethods});

  const ShopState.init({
    this.orderSummaryModel,
    required this.currentCategoryIndex,
    this.fashionProducts,
    this.healthyDiet,
    this.proMuslims,
    this.crafts,
    this.mostSoldItems,
    this.favoriteProducts,
    this.categoriesProducts,
    this.productsCategory,
    this.productsSubCategory,
    this.products,
    this.shopDashboardModel,
    this.slider,
    this.category,
    this.flashSaleProduct,
    this.banner,
    this.popularProduct,
    this.mostLikeProduct,
    this.article,
    this.loading,
    this.processing,
    this.myCart,
    this.cart,
    this.total,
    this.reviews,
    this.orderDetailModel,
    this.myOrder,
    this.order,
    this.myOrderAddress,
    this.seeAllproducts,
    this.paymentMethods,
  });

  ShopState copyWith(
      {int? currentCategoryIndex,
      ShopDashboardModel? shopDashboardModel,
      List<Slider>? slider,
      List<Category>? category,
      List<ShopProduct>? flashSaleProduct,
      ShopBannerModel? banner,
      List<ShopProduct>? popularProduct,
      List<ShopProduct>? mostLikeProduct,
      List<Article>? article,
      bool? loading,
      bool? processing,
      MyCart? myCart,
      List<Cart>? cart,
      int? total,
      Reviews? reviews,
      OrderDetailModel? orderDetailModel,
      MyOrder? myOrder,
      Morder? order,
      MyOrderAddress? myOrderAddress,
      Products? categoriesProducts,
      List<Category>? productsCategory,
      List<Subcategorie>? productsSubCategory,
      List<ShopProduct>? products,
      List<ShopProduct>? favoriteProducts,
      List<ShopProduct>? healthyDiet,
      List<ShopProduct>? proMuslims,
      List<ShopProduct>? crafts,
      List<ShopProduct>? mostSoldItems,
      ListFlProduct? seeAllproducts,
      OrderSummaryModel? orderSummaryModel,
      List<SavedPaymentMethods>? paymentMethods}) {
    return ShopState(
      orderSummaryModel: orderSummaryModel ?? this.orderSummaryModel,
      currentCategoryIndex: currentCategoryIndex ?? this.currentCategoryIndex,
      healthyDiet: healthyDiet ?? this.healthyDiet,
      proMuslims: proMuslims ?? this.proMuslims,
      crafts: crafts ?? this.crafts,
      mostSoldItems: mostSoldItems ?? this.mostSoldItems,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      categoriesProducts: categoriesProducts ?? this.categoriesProducts,
      productsCategory: productsCategory ?? this.productsCategory,
      products: products ?? this.products,
      productsSubCategory: productsSubCategory ?? this.productsSubCategory,
      reviews: reviews ?? this.reviews,
      orderDetailModel: orderDetailModel ?? this.orderDetailModel,
      myOrder: myOrder ?? this.myOrder,
      order: order ?? this.order,
      myOrderAddress: myOrderAddress ?? this.myOrderAddress,
      shopDashboardModel: shopDashboardModel ?? this.shopDashboardModel,
      slider: slider ?? this.slider,
      category: category ?? this.category,
      flashSaleProduct: flashSaleProduct ?? this.flashSaleProduct,
      banner: banner ?? this.banner,
      popularProduct: popularProduct ?? this.popularProduct,
      mostLikeProduct: mostLikeProduct ?? this.mostLikeProduct,
      article: article ?? this.article,
      loading: loading ?? this.loading,
      processing: processing ?? this.processing,
      myCart: myCart ?? this.myCart,
      cart: cart ?? this.cart,
      total: total ?? this.total,
      seeAllproducts: seeAllproducts ?? this.seeAllproducts,
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        orderSummaryModel,
        currentCategoryIndex,
        healthyDiet,
        mostSoldItems,
        proMuslims,
        crafts,
        favoriteProducts,
        categoriesProducts,
        productsCategory,
        productsSubCategory,
        products,
        shopDashboardModel,
        slider,
        category,
        flashSaleProduct,
        banner,
        popularProduct,
        mostLikeProduct,
        article,
        loading,
        processing,
        myCart,
        cart,
        total,
        reviews,
        orderDetailModel,
        myOrder,
        order,
        myOrderAddress,
        seeAllproducts,
        paymentMethods
      ];
}
