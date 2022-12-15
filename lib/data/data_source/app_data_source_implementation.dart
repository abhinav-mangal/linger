import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:linger/data/model/social_auth_request_model.dart';
import 'dart:convert';
import '../../Utils/logger_utils.dart';
import '../../services/app_json_store.dart';
import '../../services/base_api.dart';
import '../../services/http_services.dart';
import '../model/user_login_reponse_model.dart';
import 'app_data_source.dart';

class AppDataSourceImple extends AppDataSource {
  final ApiProvider apiProvider;
  final AppJsonStore appJsonStore;

  AppDataSourceImple({required this.apiProvider, required this.appJsonStore});

  @override
  Future<UserLoginResponseModel?> getUserSession() async {
    return await appJsonStore.getUserData();
  }

  @override
  Future<void> deleteUserSession() async {
    await appJsonStore.deleteUserSessionData();
  }

  @override
  Future<UserData?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    var data = ({
      "email": email,
      "password": password,
    });
    return await apiProvider.post(
      url: BaseApi.login,
      data: data,
    );
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserLoginResponseModel> getUserById() {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future register(
      {required String firstName,
      required String lastName,
      required String emailId,
      required String mobileNo,
      required String password}) async {
    var data = ({
      "first_name": firstName,
      "last_name": lastName,
      "mobile_no": mobileNo,
      "email": emailId,
      "password": password,
    });
    return await apiProvider.post(
      url: BaseApi.SIGN_UP,
      data: data,
    );
  }

  @override
  Future<void> setUserSession(
      {required UserLoginResponseModel userDataModel}) async {
    await appJsonStore.setUserData(userDataModel);
  }

  @override
  Future getUserQuestionModel(
      {required String token, required String languageId}) {
    // TODO: implement getUserQuestionModel
    throw UnimplementedError();
  }

  @override
  Future getUserQuran({required String token}) async {
    return await apiProvider.get(BaseApi.QURAN, token: token);
  }

  @override
  Future getUserQuranDetails(
      {required String token,
      required language,
      required number,
      required type}) async {
    var data = ({
      "language": language,
      "number": number,
      "type": type,
    });
    return await apiProvider.post(
        url: BaseApi.QURAN_DETAILS, token: token, data: data);
  }

  @override
  Future getUserLibraries({required String token}) async {
    return await apiProvider.post(url: BaseApi.LIBRARY, token: token);
  }

  @override
  Future getUserHome(
      {required String token,
      required String lat,
      required String long}) async {
    var data = ({
      "latitude": lat,
      "longitude": long,
    });
    return await apiProvider.post(url: BaseApi.HOME, token: token, data: data);
  }

  @override
  Future getTiming(
      {required String token,
      required String date,
      required String address}) async {
    return await apiProvider.get(
      "${BaseApi.timing}$date?address=$address",
      token: token,
    );
  }

  @override
  Future sendOTP({required String mobileNumber}) async {
    var data = ({
      "mobile_no": mobileNumber,
    });
    return await apiProvider.post(url: BaseApi.MOBILE_OTP_SIGNIN, data: data);
  }

  @override
  Future verifyOTP({required String otp, required String userId}) async {
    var data = ({
      "user_id": userId,
      "otp": otp,
    });
    return await apiProvider.post(url: BaseApi.OTP_VERIFICATION, data: data);
  }

  @override
  Future getQuestions(
      {required String token, required String languageId}) async {
    var data = ({
      "language": languageId,
    });
    return await apiProvider.post(
        url: BaseApi.QUESTION, token: token, data: data);
  }

  @override
  Future socialAuthRequest(
      {required firebase.UserCredential authRequestModel}) async {
    final userProfile = Profile(
      atHash: authRequestModel.additionalUserInfo?.profile?['at_hash'],
      exp: authRequestModel.additionalUserInfo?.profile?['exp'],
      hd: authRequestModel.additionalUserInfo?.profile?['hd'],
      azp: authRequestModel.additionalUserInfo?.profile?['azp'],
      nonce: authRequestModel.additionalUserInfo?.profile?['nonce'],
      picture: authRequestModel.additionalUserInfo?.profile?['picture'],
      locale: authRequestModel.additionalUserInfo?.profile?['locale'],
      iss: authRequestModel.additionalUserInfo?.profile?['iss'],
      emailVerified:
          authRequestModel.additionalUserInfo?.profile?['email_verified'],
      sub: authRequestModel.additionalUserInfo?.profile?['sub'],
      aud: authRequestModel.additionalUserInfo?.profile?['aud'],
      familyName: authRequestModel.additionalUserInfo?.profile?['family_name'],
      givenName: authRequestModel.additionalUserInfo?.profile?['given_name'],
      name: authRequestModel.additionalUserInfo?.profile?['name'],
      email: authRequestModel.additionalUserInfo?.profile?['email'],
      iat: authRequestModel.additionalUserInfo?.profile?['iat'],
    );
    final additionalInfo = AdditionalUserInfo(
      username: authRequestModel.additionalUserInfo?.username,
      providerId: authRequestModel.additionalUserInfo?.providerId,
      profile: userProfile,
      isNewUser: authRequestModel.additionalUserInfo?.isNewUser,
    );

    final providers = authRequestModel.user?.providerData
        .map((e) => ProviderData(
              email: e.email,
              providerId: e.providerId,
              photoURL: e.photoURL,
              uid: e.uid,
              displayName: e.displayName,
            ))
        .toList();

    final metaData = Metadata(
      creationTime:
          authRequestModel.user?.metadata.creationTime?.microsecondsSinceEpoch,
      lastSignInTime: authRequestModel
          .user?.metadata.lastSignInTime?.microsecondsSinceEpoch,
    );

    final userInfo = SocialAuthUser(
      emailVerified: authRequestModel.user?.emailVerified,
      uid: authRequestModel.user?.uid,
      providerId: authRequestModel.additionalUserInfo?.providerId,
      providerData: providers,
      refreshToken: authRequestModel.user?.refreshToken,
      email: authRequestModel.user?.email,
      isAnonymous: authRequestModel.user?.isAnonymous,
      metadata: metaData,
      phoneNumber: authRequestModel.user?.phoneNumber,
      photoURL: authRequestModel.user?.photoURL,
    );
    SocialAuthRequestModel socialAuthRequestModel = SocialAuthRequestModel(
      additionalUserInfo: additionalInfo,
      authUser: userInfo,
    );
    AppLogger.printLongString(
        'Social log query -> ${socialAuthRequestModel.toJson()}');
    return await apiProvider.post(
        url: BaseApi.SOCIAL_MEDIA_SIGNIN,
        data: json.encode(socialAuthRequestModel.toJson()));
  }

  @override
  Future updateProfile(
      {required String token,
      String? name,
      String? fLink,
      String? instaLink,
      String? twitterLink}) async {
    var data = ({
      "name": name,
      "fecebook_account_link": fLink,
      "instagram_account_link": instaLink,
      "twitter_account_link": twitterLink,
    });
    return await apiProvider.post(
      url: BaseApi.PROFILE_UPDATE,
      data: data,
      token: token,
    );
  }

  @override
  Future updateProfileImage({required String token, File? image}) async {
    List<int> imageBytes = image!.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);
    var data = ({
      "image": baseimage,
    });
    return await apiProvider.post(
      url: BaseApi.PROFILE_IMAGE,
      data: data,
      token: token,
    );
  }

  @override
  Future getPersonalProfileData({required String token}) async {
    return await apiProvider.get(
      BaseApi.PERSONSAL_PROFILE,
      token: token,
    );
  }

  @override
  Future likePOST(
      {required String token,
      required String picId,
      required String isStatus}) async {
    var data = ({
      "is_pic": picId,
      "status": isStatus,
    });
    return await apiProvider.post(
        url: BaseApi.LIKEPICOFTHEDAY, data: data, token: token);
  }

  @override
  Future likeAudio(
      {required String token,
      required String audId,
      required String isStatus}) async {
    var data = ({
      "is_audio": audId,
      "status": isStatus,
    });
    return await apiProvider.post(
        url: BaseApi.AUDIOLIKE, data: data, token: token);
  }

  @override
  Future getProducts(
      {required String token,
      String? categoryId,
      String? subCategoryId}) async {
    final queryParams = ({
      'categorie_id': categoryId ?? '',
      'sub_categorie_id': subCategoryId ?? '',
    });
    return await apiProvider.post(
      url: BaseApi.products,
      token: token,
      data: queryParams,
    );
  }

  @override
  Future getShopDashboardData({required String token}) async {
    return await apiProvider.post(
      url: BaseApi.shopDashboard,
      token: token,
    );
  }

  Future getWallet({required String token}) async {
    return await apiProvider.get(
      BaseApi.WALLET,
      token: token,
    );
  }

  @override
  Future getBookDetail(
      {required String token,
      required String bookId,
      required String chapterId,
      required String languageId}) async {
    var data = ({
      "book_id": bookId,
      "chapter_id": chapterId,
      "language": languageId,
    });
    return await apiProvider.post(
        url: BaseApi.SINGLEBOOK, token: token, data: data);
  }

  @override
  Future addProductInCart({
    required String token,
    required String productId,
    required String status,
    int? quantity,
  }) async {
    final data = ({
      "product_id": productId,
      "status": status,
      "quantity": quantity != null ? quantity.toString() : '',
    });
    return await apiProvider.post(
      url: BaseApi.addToCart,
      token: token,
      data: data,
    );
  }

  @override
  Future getMyCart({required String token}) async {
    return await apiProvider.get(
      BaseApi.getMyCart,
      token: token,
    );
  }

  @override
  Future getProductDetails(
      {required String token, required String productId}) async {
    return await apiProvider.get(
      '${BaseApi.getProductDetails}/$productId',
      token: token,
    );
  }

  @override
  Future getArticleDetails(
      {required String token, required String productId}) async {
    return await apiProvider.get(
      '${BaseApi.getArticleById}/$productId',
      token: token,
    );
  }

  @override
  Future likeProducts(
      {required String token,
      required String productId,
      required String status}) async {
    final data = ({
      "is_product": productId,
      "status": status,
    });

    return await apiProvider.post(
      url: BaseApi.likeProducts,
      token: token,
      data: data,
    );
  }

  @override
  Future addMyOrderAddress(
      {required String token,
      String? name,
      String? mobileNumber,
      String? country,
      String? passcode,
      String? address,
      String? state,
      String? city,
      String? status}) async {
    final data = ({
      "name": name,
      "mobile_number": mobileNumber,
      "country": country,
      "postcode": passcode,
      "address": address,
      "city": city,
      "state": state,
      "status": status,
    });

    return await apiProvider.post(
      url: BaseApi.addOrderAddress,
      token: token,
      data: data,
    );
  }

  @override
  Future editMyOrderAddress(
      {required String token,
      int? id,
      String? name,
      String? mobileNumber,
      String? country,
      String? passcode,
      String? address,
      String? state,
      String? city,
      String? status}) async {
    final data = ({
      "name": name,
      "mobile_number": mobileNumber,
      "country": country,
      "postcode": passcode,
      "address": address,
      "city": city,
      "state": state,
      "status": status,
    });

    return await apiProvider.post(
      url: "${BaseApi.editOrderAddress}/$id",
      token: token,
      data: data,
    );
  }

  @override
  Future deleteMyOrderAddress({
    required String token,
    int? id,
  }) async {
    return await apiProvider.post(
      url: "${BaseApi.deleteOrderAddress}/$id",
      token: token,
    );
  }

  @override
  Future addOrderMessage({required String token, String? message}) async {
    final data = ({
      "message": message,
    });

    return await apiProvider.post(
      url: BaseApi.orderMessage,
      token: token,
      data: data,
    );
  }

  @override
  Future addReview(
      {required String token,
      String? productId,
      String? rating,
      String? message}) async {
    final data = ({
      'product_id': productId,
      'rating': rating,
      'message': message,
    });

    return await apiProvider.post(
      url: BaseApi.addReview,
      token: token,
      data: data,
    );
  }

  @override
  Future getMyOrderAddress({required String token}) async {
    return await apiProvider.get(
      BaseApi.getOrderAddresses,
      token: token,
    );
  }

  @override
  Future getMyOrders({required String token, String? type}) async {
    final data = ({
      'type': type ?? 'all',
    });

    return await apiProvider.post(
      url: BaseApi.getMyOrders,
      token: token,
      data: data,
    );
  }

  @override
  Future getOrderById({required String token, String? orderId}) async {
    return await apiProvider.post(
      url: '${BaseApi.getOrderById}/$orderId',
      token: token,
    );
  }

  @override
  Future cancelOrderById({required String token, String? orderId}) async {
    return await apiProvider.post(
      url: '${BaseApi.cencelOrderById}/$orderId',
      token: token,
    );
  }

  @override
  Future makeOrder(
      {required String token,
      address,
      String? paymentMethod,
      String? shippingTotal,
      String? subTotal,
      String? total,
      String? paymentStatus}) async {
    final data = ({
      "address": address,
      "payment_method": paymentMethod,
      "shipping_amount": shippingTotal,
      "subtotal": subTotal,
      "total": total,
      "payment_status": paymentStatus,
    });

    return await apiProvider.post(
      url: BaseApi.makeOrder,
      token: token,
      data: data,
    );
  }

  @override
  Future getReview(
      {required String token,
      required String productId,
      String? rating}) async {
    final data = ({
      'rating': rating ?? '',
      'product_id': productId,
    });

    return await apiProvider.post(
      url: BaseApi.getReviews,
      token: token,
      data: data,
    );
  }

  @override
  Future getMyFavoriteProducts({required String token}) async {
    return await apiProvider.get(
      BaseApi.myFavoriteProducts,
      token: token,
    );
  }

  @override
  Future getOrderSummary({required String token}) async {
    return await apiProvider.get(
      BaseApi.orderSummary,
      token: token,
    );
  }

  @override
  Future seeAll({
    required String token,
    required String type,
  }) async {
    final data = ({
      "type": type,
    });

    return await apiProvider.post(
      url: BaseApi.seeAll,
      token: token,
      data: data,
    );
  }

  @override
  Future seeAllProducts({
    required String token,
  }) async {
    return await apiProvider.post(
      url: BaseApi.products,
      token: token,
    );
  }

  @override
  Future addPaymentMethod({
    required String token,
    String? name,
    String? cardNumber,
    String? expirationMonth,
    String? expirationYear,
    String? cvc,
    String? upi,
  }) async {
    final data = cardNumber != null
        ? ({
            "name": name,
            "card_number": cardNumber,
            "expirationMonth": expirationMonth,
            "expirationYear": expirationYear,
            "cvc": cvc,
          })
        : ({
            "upi": upi,
          });
    return await apiProvider.post(
      url: BaseApi.addPaymentMethod,
      token: token,
      data: data,
    );
  }

  @override
  Future getPaymentMethods({
    required String token,
  }) async {
    return await apiProvider.get(
      BaseApi.getPaymentMethods,
      token: token,
    );
  }

  @override
  Future updatePaymentMethod({
    required String token,
    required int id,
    required String type,
    String? name,
    String? cardNumber,
    String? expirationMonth,
    String? expirationYear,
    String? cvc,
    String? upi,
  }) async {
    final data = ({
      "type": type,
      "name": name,
      "card_number": cardNumber,
      "expirationMonth": expirationMonth,
      "expirationYear": expirationYear,
      "cvc": cvc,
      "upi": upi,
    });
    return await apiProvider.post(
        url: "${BaseApi.updatePaymentMethod}/$id", token: token, data: data);
  }
}
