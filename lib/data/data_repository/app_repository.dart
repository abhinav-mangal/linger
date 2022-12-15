import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linger/data/model/my_order/my_order.dart';
import 'package:linger/data/model/my_order_address/my_order_address.dart';
import 'package:linger/data/model/order_detail_model/order_detail_model.dart';
import 'package:linger/data/model/payment_method_model/paymentMethodModel.dart';
import 'package:linger/data/model/reviews/reviews.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_dashboard_model.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_product.dart';
import 'package:linger/data/model/user_home_reponse_model.dart';
import 'package:linger/data/model/user_profile_model.dart';
import 'package:linger/data/model/user_question_response_model.dart';
import 'package:linger/models/homepage/TimingResponse.dart';
import 'package:linger/models/librarypage/libraryResponse.dart';
import '../../core/failure.dart';
import '../../models/librarypage/bookReponse.dart';
import '../../services/http_services.dart';
import '../model/like_audio_response.dart';
import '../model/like_post_response_model.dart';
import '../model/my_cart/my_cart.dart';
import '../model/my_order/order_response_model.dart';
import '../model/order_summary_model/order_summary_model..dart';
import '../model/otp_verification_response_model.dart';
import '../model/post_response_model.dart';
import '../model/product_detail_model/product_detail_model.dart';
import '../model/product_detail_model/seeallproductsdetailmodel.dart';
import '../model/products/my_favorites.dart';
import '../model/products/products.dart';
import '../model/send_otp_response_model.dart';
import '../model/user_login_reponse_model.dart';
import '../model/user_quran_response_model.dart';
import '../model/wallet_response_model.dart';

abstract class AppRepository {
  Future<Either<Failure, UserLoginResponseModel?>> login(
      {required String email, required String password});

  Future<Either<Failure, UserLoginResponseModel?>> getCurrentUser();

  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, CustomResponse>> register({
    required String firstName,
    required String lastName,
    required String emailId,
    required String mobileNo,
    required String password,
  });

  Future<Either<Failure, UserLoginResponseModel?>> getUserSessionData();

  Future<Either<Failure, bool?>> deleteUserSessionData();

  Future<Either<Failure, bool?>> setUserSessionData(
      {required UserLoginResponseModel user});

  Future<Either<Failure, Quran?>> getUserQuran({required String token});
  Future<Either<Failure, QuranDetails?>> getUserQuranDetails(
      {required String token,
      required language,
      required number,
      required type});

  Future<Either<Failure, LibraryResponseBody?>> getUserLibraries(
      {required String token});

  Future<Either<Failure, Data?>> getUserHome(
      {required String token, required String lat, required String long});

  Future<Either<Failure, TimingResponseBody?>> getTiming(
      {required String token, required String date, required String address});

  Future<Either<Failure, SendOTPResponse?>> sendOTP(
      {required String mobileNumber});
  Future<Either<Failure, QuestionsModel?>> getQuestions(
      {required String token, required String languageId});
  Future<Either<Failure, OTPVerificationResponse?>> verifyOTP(
      {required String otp, required String userId});
  Future<Either<Failure, LikePostResponse?>> likePOST(
      {required String token, required String picId, required String isStatus});
  Future<Either<Failure, LikeAudioResponse?>> likeAudio(
      {required String token, required String audId, required String isStatus});
  Future<Either<Failure, UserLoginResponseModel?>> socialAuthRequest(
      {required UserCredential authRequestModel});

  Future<Either<Failure, PostResponseModel?>> updateProfile({
    required String token,
    String? name,
    String? fLink,
    String? instaLink,
    String? twitterLink,
  });
  Future<Either<Failure, MyInfo?>> updateProfileImage({
    required String token,
    File? image,
  });

  Future<Either<Failure, PersonalProfileModel?>> getPersonalProfileData(
      {required String token});

  Future<Either<Failure, ShopDashboardModel?>> getShopDashboardData(
      {required String token});
  Future<Either<Failure, Products?>> getProducts(
      {required String token, String? categoryId, String? subCategoryId});
  Future<Either<Failure, WalletResponseBody?>> getWallet(
      {required String token});
  Future<Either<Failure, BookResponseBody?>> getBookDetail(
      {required String token,
      required String bookId,
      required String chapterId,
      required String languageId});

  Future<Either<Failure, ProductDetailModel?>> getProductDetails(
      {required String token, required String productId});
  Future<Either<Failure, ShopDashboardModel?>> getArticleDetails(
      {required String token, required String productId});

  Future<Either<Failure, MyCart?>> getMyCart({required String token});

  Future<Either<Failure, PostResponseModel?>> addProductInCart(
      {required String token,
      required String productId,
      required String status,
      int? quantity});

  Future<Either<Failure, PostResponseModel?>> likeProducts(
      {required String token,
      required String productId,
      required String status});

  Future<Either<Failure, Reviews?>> getReview(
      {required String token, required String productId, String? rating});

  Future<Either<Failure, PostResponseModel?>> addReview(
      {required String token,
      String? productId,
      String? rating,
      String? message});
  Future<Either<Failure, PostResponseModel?>> addOrderMessage(
      {required String token, String? message});
  Future<Either<Failure, OrderDetailModel?>> getOrderById(
      {required String token, String? orderId});
  Future<Either<Failure, PostResponseModel?>> cancelOrderById(
      {required String token, String? orderId});
  Future<Either<Failure, MyOrder?>> getMyOrders(
      {required String token, String? type});

  Future<Either<Failure, PostResponseModel?>> addMyOrderAddress(
      {required String token,
      String? name,
      String? mobileNumber,
      String? country,
      String? passcode,
      String? address,
      String? state,
      String? city,
      String? status});
  Future<Either<Failure, PostResponseModel?>> editMyOrderAddress({
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
  Future<Either<Failure, PostResponseModel?>> deleteMyOrderAddress({
    required String token,
    int? id,
  });

  Future<Either<Failure, MyOrderAddress?>> getMyOrderAddress({
    required String token,
  });

  Future<Either<Failure, OrderResponseModel?>> makeOrder({
    required String token,
    dynamic address,
    String? paymentMethod,
    String? shippingTotal,
    String? subTotal,
    String? total,
    String? paymentStatus,
  });

  Future<Either<Failure, OrderSummaryModel?>> getOrderSummary({
    required String token,
  });

  Future<Either<Failure, MyFavoriteProduct?>> getMyFavoriteProducts({
    required String token,
  });
  Future<Either<Failure, SeeAllModel?>> seeAll(
      {required String token, required String type});
  Future<Either<Failure, SeeAllModel?>> seeAllProducts({required String token});

  Future<Either<Failure, PostResponseModel?>> addPaymentMethod(
      {required String token,
      String? name,
      String? cardNumber,
      String? expirationMonth,
      String? expirationYear,
      String? cvc,
      String? upi});
  Future<Either<Failure, PaymentMethod?>> getPaymentMethods(
      {required String token});
  Future<Either<Failure, PostResponseModel?>> updatePaymentMethod(
      {required String token,
      required int id,
      required String type,
      String? name,
      String? cardNumber,
      String? expirationMonth,
      String? expirationYear,
      String? cvc,
      String? upi});
}
