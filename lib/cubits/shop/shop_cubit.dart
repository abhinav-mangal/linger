import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Utils/flushbar_notification.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/data/data_repository/app_repository.dart';
import 'package:linger/data/model/my_order/my_order.dart';
import 'package:linger/data/model/my_order_address/my_order_address.dart';
import 'package:linger/data/model/order_detail_model/order_detail_model.dart';
import 'package:linger/data/model/payment_method_model/paymentMethodModel.dart';
import 'package:linger/data/model/products/products_model.dart';
import 'package:linger/data/model/reviews/reviews.dart';
import 'package:linger/data/model/shop_dashboard_model/flash_sale_product.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/shope/cartscreen.dart';
import 'package:linger/ui/shope/cubit/product_detail_view_cubit.dart';
import 'package:linger/ui/shope/product_detail_screen.dart';
import '../../Utils/progress_utility.dart';
import '../../data/model/my_cart/cart.dart';
import '../../data/model/my_cart/my_cart.dart';
import '../../data/model/my_order/morder.dart';
import '../../data/model/order_summary_model/order_summary_model..dart';
import '../../data/model/product_detail_model/seeallproductsdetailmodel.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit()
      : super(
          const ShopState.init(
            loading: false,
            currentCategoryIndex: 0,
          ),
        );

  final dataRepo = getItInjector<AppRepository>();
  String? myToken;
  String updatePaymentMethod = "paytm";
  final route = getItInjector<AppRouter>();

  void init(BuildContext context) async {
    final authCubit = context.read<ProfileCubit>();
    myToken = authCubit.state.user?.token ?? '';

    getShopData();
    getCartData();
    getMyOrders();
    getMyAddress();
    getMyFavorites();
    getMyOrderSummary();
    defaultPaymentMethod();
    seeAllProducts();
    getPaymentMethods();
  }

  void changePaymentMethod(BuildContext context, String value) {
    emit(state.copyWith(order: Morder.fromJson({"payment_method": value})));
  }

  void defaultPaymentMethod() {
    emit(state.copyWith(
        order: Morder.fromJson(const {"payment_method": "paytm"})));
  }

  void onCategoryTap(int index, BuildContext context,
      {String? categoryId, String? subCategoryId}) {
    emit(state.copyWith(
      currentCategoryIndex: index,
    ));
    getProductByCategory(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );
  }

  void getShopData() async {
    emit(state.copyWith(
      loading: true,
    ));

    final res = await dataRepo.getShopDashboardData(
      token: myToken ?? '',
    );

    emit(state.copyWith(
      loading: false,
      slider: [],
      category: [],
      flashSaleProduct: [],
      popularProduct: [],
      mostLikeProduct: [],
      article: [],
    ));
    res.fold((l) {}, (r) {
      emit(state.copyWith(
        shopDashboardModel: r,
        slider: r?.data?.slider,
        category: r?.data?.category,
        flashSaleProduct: r?.data?.flashSaleProduct,
        banner: r?.data?.banner,
        popularProduct: r?.data?.popularProduct,
        mostLikeProduct: r?.data?.mostLikeProduct,
        article: r?.data?.article,
      ));
    });
  }

  Future<void> getProductByCategory(
      {String? categoryId, String? subCategoryId}) async {
    ProgressUtil.showProgress(
        context: route.navigatorKey.currentState!.context);
    final res = await dataRepo.getProducts(
      token: myToken ?? '',
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );
    ProgressUtil.hideProgress();
    emit(state.copyWith(
      loading: false,
    ));
    res.fold((l) {}, (r) {
      emit(state.copyWith(
        categoriesProducts: r,
        productsCategory: r?.data?.category ?? [],
        productsSubCategory: r?.data?.subcategorie ?? [],
        products: r?.data?.product ?? [],
      ));
    });
  }
  // void addSubCategories()async{
  //   final pr =state.productsSubCategory;
  //   List<Subcategorie> ?stdysubcategorie = pr?.isNotEmpty?pr!.insert(0, Subcategorie(name: "All",image: "null",id: 0)):[];
  //   emit(state.copyWith(
  //     productsSubCategory: state.productsSubCategory!.add(Subcategorie(name: "All",image: "null",id: 0)),
  //   ));
  // }

  // Future<void> getAllProducts(
  //     {String? categoryId, String? subCategoryId}) async {
  //   ProgressUtil.showProgress(
  //       context: route.navigatorKey.currentState!.context);
  //   final res = await dataRepo.getProducts(
  //     token: myToken ?? '',
  //     categoryId: categoryId,
  //     subCategoryId: subCategoryId,
  //   );
  //   ProgressUtil.hideProgress();
  //   emit(state.copyWith(
  //     loading: false,
  //   ));
  //   res.fold((l) {}, (r) {
  //     emit(state.copyWith(
  //       categoriesProducts: r,
  //       productsCategory: r?.data?.category ?? [],
  //       productsSubCategory: r?.data?.subcategorie ?? [],
  //       products: r?.data?.product ?? [],
  //     ));
  //   });
  // }

  Future<void> getCartData() async {
    final res = await dataRepo.getMyCart(
      token: myToken ?? '',
    );

    res.fold((l) {
      emit(state.copyWith(
        cart: [],
        total: 0,
      ));
    }, (r) {
      emit(state.copyWith(
        myCart: r,
        cart: r?.data?.cart,
        total: r?.data?.total,
      ));
    });
  }

  Future<void> getProductReviews(String id, {String? rating}) async {
    final res = await dataRepo.getReview(
      token: myToken ?? '',
      rating: rating ?? '',
      productId: id,
    );

    res.fold((l) {}, (r) {
      emit(state.copyWith(
        reviews: r,
      ));
    });
  }

  Future<void> getMyOrders() async {
    final res = await dataRepo.getMyOrders(
      token: myToken ?? '',
    );

    res.fold((l) {}, (r) {
      emit(state.copyWith(
        myOrder: r,
      ));
    });
  }

  void getMyFavorites() async {
    final res = await dataRepo.getMyFavoriteProducts(
      token: myToken ?? '',
    );

    res.fold((l) {}, (r) {
      emit(state.copyWith(
        favoriteProducts: r?.data?.products,
      ));
    });
  }

  Future<void> getMyOrderSummary() async {
    final res = await dataRepo.getOrderSummary(
      token: myToken ?? '',
    );

    res.fold((l) {}, (r) {
      emit(state.copyWith(
        orderSummaryModel: r,
      ));
    });
  }

  Future<void> getMyAddress() async {
    final res = await dataRepo.getMyOrderAddress(
      token: myToken ?? '',
    );

    res.fold((l) {}, (r) {
      emit(state.copyWith(
        myOrderAddress: r,
      ));
    });
  }

  void getOrderDetail(String productId) async {
    emit(state.copyWith(
      loading: true,
    ));
    final res = await dataRepo.getOrderById(
      token: myToken ?? '',
      orderId: productId,
    );
    emit(state.copyWith(
      loading: false,
    ));
    res.fold((l) {}, (r) {
      emit(state.copyWith(
        orderDetailModel: r,
      ));
    });
  }

  void cancelOrderById(BuildContext context, String productId) async {
    emit(state.copyWith(
      loading: true,
    ));
    ProgressUtil.showProgress(context: context);

    var response = await dataRepo.cancelOrderById(
      token: myToken ?? '',
      orderId: productId,
    );
    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message ?? '');
      return false;
    }, (r) async {
      await getMyOrders();
      Navigator.pop(context);
      return true;
    });
    return null;
  }

  Future<bool?> addRemoveCartItem(
    BuildContext context, {
    required int productId,
    int? quantity,
    String? status,
  }) async {
    if (state.processing ?? false) {
      return null;
    }
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);
    final myCartItems = [...?state.cart];
    bool isProductOnCart =
        myCartItems.any((element) => element.productId == productId);
    final response = await dataRepo.addProductInCart(
      token: myToken ?? '',
      productId: productId.toString(),
      status: status ?? (isProductOnCart ? '0' : '1'),
      quantity: quantity,
    );

    emit(state.copyWith(
      processing: false,
    ));
    response.fold((l) {
      ProgressUtil.hideProgress();
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to add product');
    }, (r) async {
      getShopData();
      await getCartData();
      ProgressUtil.hideProgress();
      FlushBarNotification.showSnack(
          title: r?.message ?? '',
          actionLabel: 'View cart',
          onTapAction: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (_) => const CartScreen()));
          });
      isProductOnCart = !isProductOnCart;
    });
    return isProductOnCart;
  }

  Future<ShopProduct?> likeDislikeProduct(BuildContext context,
      {required ShopProduct product}) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);
    final bool isLiked = product.likeStatus.toString() == '1';
    final response = await dataRepo.likeProducts(
      token: myToken ?? '',
      productId: product.id.toString(),
      status: isLiked ? '0' : '1',
    );
    ProgressUtil.hideProgress();
    emit(state.copyWith(
      processing: false,
    ));
    response.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to like product');
      return null;
    }, (r) {
      getMyFavorites();
      return product.copyWith(
        likeStatus: _getLikeState(r),
      );
    });
    return null;
  }

  void seeAll({required String type}) async {
    emit(state.copyWith(
      processing: true,
    ));
    final response = await dataRepo.seeAll(
      token: myToken ?? '',
      type: type,
    );
    emit(state.copyWith(
      processing: false,
    ));
    response.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to load products');
      return null;
    }, (r) {
      emit(state.copyWith(
        seeAllproducts: r?.data,
      ));
    });
  }

  void seeAllProducts() async {
    emit(state.copyWith(
      processing: true,
    ));
    final response = await dataRepo.seeAllProducts(
      token: myToken ?? '',
    );
    emit(state.copyWith(
      processing: false,
    ));
    response.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to load products');
      return null;
    }, (r) {
      emit(state.copyWith(
        seeAllproducts: r?.data,
      ));
    });
  }

  void getArticle({required String type}) async {
    emit(state.copyWith(
      processing: true,
    ));
    final response = await dataRepo.seeAll(
      token: myToken ?? '',
      type: type,
    );
    emit(state.copyWith(
      processing: false,
    ));
    response.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to load products');
      return null;
    }, (r) {
      emit(state.copyWith(
        seeAllproducts: r?.data,
      ));
    });
  }

  int? _getLikeState(dynamic data) {
    try {
      return data as int;
    } catch (e) {
      return 0;
    }
  }

  Future<bool?> setAddress(
    BuildContext context, {
    String? name,
    String? mobileNumber,
    String? country,
    String? passcode,
    String? address,
    String? stateStr,
    String? city,
    String? status,
  }) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.addMyOrderAddress(
      token: myToken ?? '',
      name: name,
      mobileNumber: mobileNumber,
      country: country,
      passcode: passcode,
      address: address,
      state: stateStr,
      city: city,
      status: status,
    );

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message ?? '');
      return false;
    }, (r) async {
      await getMyAddress();
      Navigator.pop(context);
      return true;
    });
    return null;
  }

  Future<bool?> editAddress(
    BuildContext context, {
    int? id,
    String? name,
    String? mobileNumber,
    String? country,
    String? passcode,
    String? address,
    String? stateStr,
    String? city,
    String? status,
  }) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.editMyOrderAddress(
      token: myToken ?? '',
      id: id,
      name: name,
      mobileNumber: mobileNumber,
      country: country,
      passcode: passcode,
      address: address,
      state: stateStr,
      city: city,
      status: status,
    );

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message ?? '');
      return false;
    }, (r) async {
      //  getShopData();
      // getCartData();
      // getMyOrders();
      await getMyOrderSummary();
      await getMyAddress();
      Navigator.pop(context);
      return true;
    });
    return null;
  }

  Future<bool?> deleteMyOrderAddress(
    BuildContext context, {
    int? id,
  }) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.deleteMyOrderAddress(
      token: myToken ?? '',
      id: id,
    );

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message ?? '');
      return false;
    }, (r) async {
      //  getShopData();
      // getCartData();
      // getMyOrders();
      await getMyAddress();
      return true;
    });
    return null;
  }

  Future<bool?> addReview(
    BuildContext context, {
    required ShopProduct product,
    String? rating,
    String? message,
  }) async {
    bool success = false;
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.addReview(
      token: myToken ?? '',
      productId: product.id.toString(),
      rating: rating,
      message: message,
    );

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message);
      success = false;
    }, (r) {
      success = true;
    });
    return success;
  }

  Future<bool?> sendMessage(
    BuildContext context, {
    String? message,
  }) async {
    bool success = false;
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.addOrderMessage(
      token: myToken ?? '',
      message: message,
    );

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message);
      success = false;
    }, (r) {
      FlushBarNotification.showSnack(
          title: r?.message ?? 'Order message sent!');
      success = false;
    });
    return success;
  }

  Future<bool?> createOrder(
    BuildContext context, {
    required String address,
    String? paymentMethod,
    String? shippingTotal,
    String? subTotal,
    String? total,
    String? paymentStatus,
    String? paymentId,
    String? couponCode,
  }) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.makeOrder(
      token: myToken ?? '',
      address: address,
      paymentMethod: paymentMethod,
      shippingTotal: shippingTotal,
      subTotal: subTotal,
      total: total,
      paymentStatus: paymentStatus,
      paymentId: paymentId,
      couponCode: couponCode
    );

    await getCartData();

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message);
      return false;
    }, (r) {
      emit(state.copyWith(order: r?.data));
      return true;
    });

    return null;
  }

  Future<bool?> addPaymentMethod(
    BuildContext context, {
    String? name,
    String? cardNumber,
    String? expirationMonth,
    String? expirationYear,
    String? cvc,
    String? upi,
  }) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.addPaymentMethod(
        token: myToken ?? '',
        name: name,
        cardNumber: cardNumber,
        expirationMonth: expirationMonth,
        expirationYear: expirationYear,
        cvc: cvc,
        upi: upi);

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message);
      return false;
    }, (r) async {
      FlushBarNotification.showSnack(title: r?.message);
      // emit(state.copyWith(paymentMethods: r?.data));
      await getPaymentMethods();
      return true;
    });

    return null;
  }

  Future<void> getPaymentMethods() async {
    final res = await dataRepo.getPaymentMethods(
      token: myToken ?? '',
    );

    res.fold((l) {
      emit(state.copyWith(
        paymentMethods: [],
      ));
    }, (r) {
      emit(state.copyWith(
        paymentMethods: r?.data,
      ));
    });
  }

  Future<bool?> editDeletePaymentMethod(
    BuildContext context, {
    required String type,
    required int id,
    String? name,
    String? cardNumber,
    String? expirationMonth,
    String? expirationYear,
    String? cvc,
    String? upi,
  }) async {
    emit(state.copyWith(
      processing: true,
    ));
    ProgressUtil.showProgress(context: context);

    final response = await dataRepo.updatePaymentMethod(
        id: id,
        token: myToken ?? '',
        type: type,
        name: name,
        cardNumber: cardNumber,
        expirationMonth: expirationMonth,
        expirationYear: expirationYear,
        cvc: cvc,
        upi: upi);

    ProgressUtil.hideProgress();

    emit(state.copyWith(
      processing: false,
    ));

    response.fold((l) {
      FlushBarNotification.showSnack(title: l.message ?? '');
      return false;
    }, (r) async {
      FlushBarNotification.showSnack(title: r?.message ?? '');
      getPaymentMethods();
      Navigator.pop(context);
      return true;
    });
    return null;
  }

  Future<ShopProduct> getShopProduct(int id, List<ShopProduct>? product) async {
    return product!.where((element) => (element.id) == (id)).first;
  }

  onRemoveTap(BuildContext context, {int? productId}) async {
    // late final ProductDetailVewCubit productDetailVewCubit;

    // ShopProduct productById = await getShopProduct(productId, product);
    // ProductDetailScreen.newInstance(
    //   productId.toString(),
    //   productById,
    // );

    addRemoveCartItem(
      context,
      productId: productId!,
      status: "3",
    );
  }
}
