import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_login_reponse_model.dart';

abstract class AppDataSource {
  Future<dynamic> login({required String email, required String password});

  Future<dynamic> register(
      {required String firstName,
      required String lastName,
      required String emailId,
      required String mobileNo,
      required String password});

  Future<UserLoginResponseModel> getUserById();

  Future<bool> logout();

  Future<void> deleteUserSession();

  Future<void> setUserSession({required UserLoginResponseModel userDataModel});

  Future<UserLoginResponseModel?> getUserSession();

  Future<dynamic> getUserQuestionModel(
      {required String token, required String languageId});
  Future<dynamic> getUserQuran({required String token});
  Future<dynamic> getUserQuranDetails(
      {required String token,
      required language,
      required number,
      required type});

  Future<dynamic> getUserLibraries({required String token});
  Future<dynamic> getUserHome(
      {required String token, required String lat, required String long});
  Future<dynamic> getTiming(
      {required String token, required String date, required String address});
  Future<dynamic> getQuestions(
      {required String token, required String languageId});
  Future<dynamic> sendOTP({required String mobileNumber});
  Future<dynamic> likePOST(
      {required String token, required String picId, required String isStatus});
  Future<dynamic> likeAudio(
      {required String token, required String audId, required String isStatus});
  Future<dynamic> verifyOTP({required String otp, required String userId});
  Future<dynamic> socialAuthRequest({required UserCredential authRequestModel});

  Future<dynamic> updateProfile({
    required String token,
    String? name,
    String? fLink,
    String? instaLink,
    String? twitterLink,
  });

  Future<dynamic> getPersonalProfileData({
    required String token,
  });
  Future<dynamic> getWallet({
    required String token,
  });

  Future<dynamic> updateProfileImage({required String token, File? image});

  Future<dynamic> getShopDashboardData({required String token});

  Future<dynamic> getProducts(
      {required String token, String? categoryId, String? subCategoryId});
  Future<dynamic> getBookDetail(
      {required String token,
      required String bookId,
      required String chapterId,
      required String languageId});

  Future<dynamic> getProductDetails(
      {required String token, required String productId});
  Future<dynamic> getArticleDetails(
      {required String token, required String productId});

  Future<dynamic> getMyCart({required String token});

  Future<dynamic> addProductInCart(
      {required String token,
      required String productId,
      required String status,
      int? quantity});

  Future<dynamic> likeProducts(
      {required String token,
      required String productId,
      required String status});

  Future<dynamic> getReview(
      {required String token, required String productId, String? rating});
  Future<dynamic> addReview(
      {required String token,
      String? productId,
      String? rating,
      String? message});
  Future<dynamic> addOrderMessage({required String token, String? message});
  Future<dynamic> getOrderById({required String token, String? orderId});
  Future<dynamic> cancelOrderById({required String token, String? orderId});
  Future<dynamic> getMyOrders({required String token, String? type});

  Future<dynamic> addMyOrderAddress({
    required String token,
    String? name,
    String? mobileNumber,
    String? country,
    String? passcode,
    String? address,
    String? state,
    String? city,
    String? status,
  });
  Future<dynamic> editMyOrderAddress({
    required String token,
    int? id,
    String? name,
    String? mobileNumber,
    String? country,
    String? passcode,
    String? address,
    String? state,
    String? city,
    String? status,
  });
  Future<dynamic> deleteMyOrderAddress({
    required String token,
    int? id,
  });

  Future<dynamic> getMyOrderAddress({
    required String token,
  });

  Future<dynamic> getOrderSummary({
    required String token,
  });

  Future<dynamic> getMyFavoriteProducts({
    required String token,
  });

  Future<dynamic> makeOrder({
    required String token,
    dynamic address,
    String? paymentMethod,
    String? shippingTotal,
    String? subTotal,
    String? total,
    String? paymentStatus,
  });

  Future<dynamic> seeAll({required String token, required String type});
  Future<dynamic> seeAllProducts({required String token});

  Future<dynamic> addPaymentMethod(
      {required String token,
      String? name,
      String? cardNumber,
      String? expirationMonth,
      String? expirationYear,
      String? cvc,
      String? upi});
  Future<dynamic> getPaymentMethods({required String token});
  Future<dynamic> updatePaymentMethod(
      {required String token,
      required String type,
      required int id,
      String? name,
      String? cardNumber,
      String? expirationMonth,
      String? expirationYear,
      String? cvc,
      String? upi});
}
