import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linger/data/model/my_cart/my_cart.dart';
import 'package:linger/data/model/order_detail_model/order_detail_model.dart';
import 'package:linger/data/model/my_order_address/my_order_address.dart';
import 'package:linger/data/model/my_order/my_order.dart';
import 'package:linger/data/model/order_summary_model/order_summary_model..dart';
import 'package:linger/data/model/otp_verification_response_model.dart';
import 'package:linger/data/model/payment_method_model/paymentMethodModel.dart';
import 'package:linger/data/model/post_response_model.dart';
import 'package:linger/data/model/product_detail_model/product_detail_model.dart';
import 'package:linger/data/model/product_detail_model/seeallproductsdetailmodel.dart';
import 'package:linger/data/model/products/my_favorites.dart';
import 'package:linger/data/model/reviews/reviews.dart';
import 'package:linger/data/model/send_otp_response_model.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_dashboard_model.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_product.dart';
import 'package:linger/data/model/user_home_reponse_model.dart';
import 'package:linger/data/model/user_profile_model.dart';
import 'package:linger/data/model/user_question_response_model.dart';
import 'package:linger/data/model/user_quran_response_model.dart';
import 'package:linger/models/homepage/TimingResponse.dart';
import 'package:linger/models/librarypage/libraryResponse.dart';
import '../../core/failure.dart';
import '../../models/librarypage/bookReponse.dart';
import '../../services/connectivity_service.dart';
import '../../services/http_services.dart';
import '../../utils/logger_utils.dart';
import '../data_source/app_data_source.dart';
import '../model/like_audio_response.dart';
import '../model/like_post_response_model.dart';
import '../model/my_order/order_response_model.dart';
import '../model/products/products.dart';
import '../model/user_login_reponse_model.dart';
import '../model/wallet_response_model.dart';
import 'app_repository.dart';

class AppRepositoryImple extends AppRepository {
  final ConnectivityService connectivityService;
  final AppDataSource appDataSource;

  AppRepositoryImple({
    required this.appDataSource,
    required this.connectivityService,
  });

  @override
  Future<Either<Failure, UserLoginResponseModel?>> login(
      {required String email, required String password}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.login(email: email, password: password);
        if (res['success'] == true) {
          final userResponseModel = UserLoginResponseModel.fromJson(res);
          AppLogger.i('res -> $res , user -> ${userResponseModel.user}');
          return Right(userResponseModel);
        } else {
          return Left(NotFound(
              message:
                  res['message'] ?? 'Failed to login, Invalid Credential'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to login, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await appDataSource.deleteUserSession();
      return const Right(true);
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(
      {required String userId, required File image}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool?>> deleteUserSessionData() async {
    try {
      await appDataSource.deleteUserSession();
      return const Right(true);
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }

  @override
  Future<Either<Failure, UserLoginResponseModel?>> getUserSessionData() async {
    try {
      final res = await appDataSource.getUserSession();
      if (res != null) {
        return Right(res);
      }
      return const Left(NotFound(message: 'Failed to load data!'));
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }

  @override
  Future<Either<Failure, UserLoginResponseModel?>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool?>> setUserSessionData(
      {required UserLoginResponseModel user}) async {
    try {
      await appDataSource.setUserSession(userDataModel: user);
      return const Right(true);
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }

  @override
  Future<Either<Failure, CustomResponse>> register(
      {required String firstName,
      required String lastName,
      required String emailId,
      required String mobileNo,
      required String password}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.register(
            firstName: firstName,
            lastName: lastName,
            emailId: emailId,
            mobileNo: mobileNo,
            password: password);

        if (res['success'] != null && res['success'] == true) {
          return Right(CustomResponse(
            isSuccess: true,
            data: '',
            message: res['message'],
          ));
        } else {
          return Right(CustomResponse(
            isSuccess: false,
            data: '',
            message: res['message'],
          ));
        }
      } catch (e) {
        AppLogger.i('reg res -> ${e.toString()}');
        return Left(NotFound(message: e.toString()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Quran?>> getUserQuran({required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getUserQuran(token: token);
        if (res['success'] == true) {
          final userQuranResponseModel = UserQuranResponseModel.fromJson(res);
          AppLogger.i('res -> $res , user -> ${userQuranResponseModel.data}');
          return Right(userQuranResponseModel.data);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to load user quran,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to load user quran, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, QuranDetails?>> getUserQuranDetails(
      {required String token,
      required language,
      required number,
      required type}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getUserQuranDetails(
            token: token, language: language, number: number, type: type);
        if (res['success'] == true) {
          final userQuranResponseModel = QuranResponseDetails.fromJson(res);
          AppLogger.i('res -> $res , user -> ${userQuranResponseModel.data}');
          return Right(userQuranResponseModel.data);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to load user quran,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to load user quran, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, LibraryResponseBody?>> getUserLibraries(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getUserLibraries(token: token);
        if (res['success'] == true) {
          final userQuranResponseModel = LibraryResponse.fromJson(res);
          AppLogger.i(
              'res -> $res , user -> ${userQuranResponseModel.libraryResponseBody}');
          return Right(userQuranResponseModel.libraryResponseBody);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to load user library,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to load user library, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, Data?>> getUserHome(
      {required String token,
      required String lat,
      required String long}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        Map<String, dynamic> res =
            await appDataSource.getUserHome(token: token, lat: lat, long: long);
        if (res['success'] == true) {
          final userHomeResponseModel = UserHomeResponseModel.fromJson(res);
          AppLogger.i('res -> $res , home -> ${userHomeResponseModel.data}');
          return Right(userHomeResponseModel.data);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to load home data,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to load home data, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, TimingResponseBody?>> getTiming(
      {required String token,
      required String date,
      required String address}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getTiming(
            token: token, date: date, address: address);
        if (res['success'] == true) {
          final timingResponseModel = TimingResponse.fromJson(res);
          AppLogger.i(
              'res -> $res , timing -> ${timingResponseModel.timingResponseBody}');
          return Right(timingResponseModel.timingResponseBody);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to load user library,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to load user library, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, SendOTPResponse?>> sendOTP(
      {required String mobileNumber}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.sendOTP(mobileNumber: mobileNumber);
        if (res['success'] == true) {
          final sendOTPResponse = SendOTPResponse.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${sendOTPResponse.toJson()}');
          return Right(sendOTPResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to send otp,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to send otp, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, LikePostResponse?>> likePOST(
      {required String token,
      required String picId,
      required String isStatus}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.likePOST(
            token: token, picId: picId, isStatus: isStatus);
        if (res['success'] == true) {
          final likePostResponse = LikePostResponse.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${likePostResponse.toJson()}');
          return Right(likePostResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to like the post,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to like the post, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, LikeAudioResponse?>> likeAudio(
      {required String token,
      required String audId,
      required String isStatus}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.likeAudio(
            token: token, audId: audId, isStatus: isStatus);
        if (res['success'] == true) {
          final likeAudioResponse = LikeAudioResponse.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${likeAudioResponse.toJson()}');
          return Right(likeAudioResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to like the audio,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to like the audio, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, OTPVerificationResponse?>> verifyOTP(
      {required String otp, required String userId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.verifyOTP(otp: otp, userId: userId);
        if (res['status'] == true) {
          final sendOTPResponse = OTPVerificationResponse.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${sendOTPResponse.toJson()}');
          return Right(sendOTPResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to verify otp,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to verify otp, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, QuestionsModel?>> getQuestions(
      {required String token, required String languageId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getQuestions(
            token: token, languageId: languageId);
        if (res['success'] == true) {
          final userquestionsResponseModel =
              UserQuestionsResponseModel.fromJson(res);
          AppLogger.i(
              'res -> $res , home -> ${userquestionsResponseModel.data}');
          return Right(userquestionsResponseModel.data);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to load home data,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to load home data, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, UserLoginResponseModel?>> socialAuthRequest(
      {required UserCredential authRequestModel}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.socialAuthRequest(
            authRequestModel: authRequestModel);
        if (res['status'] == true) {
          final sendOTPResponse = UserLoginResponseModel.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${sendOTPResponse.toJson()}');
          return Right(sendOTPResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to perform action,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to social auth, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> updateProfile(
      {required String token,
      String? name,
      String? fLink,
      String? instaLink,
      String? twitterLink}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.updateProfile(
          token: token,
          name: name,
          fLink: fLink,
          instaLink: instaLink,
          twitterLink: twitterLink,
        );
        if (res['status'] == true) {
          final sendOTPResponse = PostResponseModel.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${sendOTPResponse.toJson()}');
          return Right(sendOTPResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to perform action,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to social auth, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, MyInfo?>> updateProfileImage({
    required String token,
    File? image,
  }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.updateProfileImage(
          token: token,
          image: image,
        );
        if (res['status'] == true) {
          final myInfoResponse = MyInfo.fromJson(res);
          AppLogger.i('res -> $res , otp -> ${myInfoResponse.toJson()}');
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to perform action,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to social auth, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PersonalProfileModel?>> getPersonalProfileData(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getPersonalProfileData(token: token);
        if (res['status'] == true) {
          final sendOTPResponse = PersonalProfileModel.fromJson(res);
          AppLogger.i('res -> $res , personal -> ${sendOTPResponse.toJson()}');
          return Right(sendOTPResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to perform action,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to social auth, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, Products?>> getProducts(
      {required String token,
      String? categoryId,
      String? subCategoryId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getProducts(
          token: token,
          categoryId: categoryId,
          subCategoryId: subCategoryId,
        );
        if (res['success'] == true) {
          final product = Products.fromJson(res);
          AppLogger.i('res -> $res , product data -> ${product.toJson()}');
          return Right(product);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get procuct,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, ShopDashboardModel?>> getShopDashboardData(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getShopDashboardData(token: token);
        if (res['success'] == true) {
          final product = ShopDashboardModel.fromJson(res);
          print(product);
          return Right(product);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get procuct,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, WalletResponseBody?>> getWallet(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getWallet(token: token);
        if (res["success"] == true) {
          final walletResponse = WalletResponse.fromJson(res);
          AppLogger.i('res -> $res , personal -> ${walletResponse.toJson()}');
          return Right(walletResponse.data);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to perform action,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to social auth, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, BookResponseBody?>> getBookDetail(
      {required String token,
      required String bookId,
      required String chapterId,
      required String languageId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getBookDetail(
            token: token,
            bookId: bookId,
            chapterId: chapterId,
            languageId: languageId);
        if (res["success"] == true) {
          final walletResponse = BookResponse.fromJson(res);
          AppLogger.i('res -> $res , personal -> ${walletResponse.toJson()}');
          return Right(walletResponse.data);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to perform action,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to social auth, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> addProductInCart(
      {required String token,
      required String productId,
      required String status,
      int? quantity,
      String? color,
      String? size,
      }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.addProductInCart(
          token: token,
          productId: productId,
          status: status,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to add product,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, MyCart?>> getMyCart({required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getMyCart(token: token);
        if (res['success'] == true) {
          final product = MyCart.fromJson(res);
          return Right(product);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get cart,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get cart, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, ProductDetailModel?>> getProductDetails(
      {required String token, required String productId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getProductDetails(
            token: token, productId: productId);
        if (res['success'] == true) {
          final product = ProductDetailModel.fromJson(res);
          return Right(product);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get product,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, ShopDashboardModel?>> getArticleDetails(
      {required String token, required String productId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getArticleDetails(
            token: token, productId: productId);
        if (res['success'] == true) {
          final product = ShopDashboardModel.fromJson(res);
          return Right(product);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get product,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> likeProducts(
      {required String token,
      required String productId,
      required String status}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.likeProducts(
          token: token,
          productId: productId,
          status: status,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to like product,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to like product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> addMyOrderAddress(
      {required String token,
      String? name,
      String? mobileNumber,
      String? country,
      String? passcode,
      String? address,
      String? state,
      String? city,
      String? status}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.addMyOrderAddress(
          token: token,
          name: name,
          mobileNumber: mobileNumber,
          country: country,
          passcode: passcode,
          address: address,
          state: state,
          city: city,
          status: status,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to add address,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add address, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> editMyOrderAddress(
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
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.editMyOrderAddress(
          token: token,
          id: id,
          name: name,
          mobileNumber: mobileNumber,
          country: country,
          passcode: passcode,
          address: address,
          state: state,
          city: city,
          status: status,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to add address,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add address, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> deleteMyOrderAddress({
    required String token,
    int? id,
  }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.deleteMyOrderAddress(
          token: token,
          id: id,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to add address,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add address, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> addOrderMessage(
      {required String token, String? message}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.addOrderMessage(
          token: token,
          message: message,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to add message,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add message, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> addReview(
      {required String token,
      String? productId,
      String? rating,
      String? message}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.addReview(
          token: token,
          productId: productId,
          rating: rating,
          message: message,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to add review,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add review, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, MyOrderAddress?>> getMyOrderAddress(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getMyOrderAddress(token: token);
        if (res['success'] == true) {
          final myInfoResponse = MyOrderAddress.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(NotFound(message: res['message'] ?? ''));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get address , $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, MyOrder?>> getMyOrders(
      {required String token, String? type}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getMyOrders(token: token);
        if (res['success'] == true) {
          final myInfoResponse = MyOrder.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get orders,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get orders, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, OrderDetailModel?>> getOrderById(
      {required String token, String? orderId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getOrderById(
          token: token,
          orderId: orderId,
        );
        if (res['success'] == true) {
          final myInfoResponse = OrderDetailModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to get order detail,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get order detail, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> cancelOrderById(
      {required String token, String? orderId}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.cancelOrderById(
          token: token,
          orderId: orderId,
        );
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to get order detail,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get order detail, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, Reviews?>> getReview(
      {required String token,
      required String productId,
      String? rating}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getReview(
          token: token,
          productId: productId,
          rating: rating,
        );
        if (res['success'] == true) {
          final myInfoResponse = Reviews.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to get review,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get review, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, OrderResponseModel?>> makeOrder({
    required String token,
    address,
    String? paymentMethod,
    String? shippingTotal,
    String? subAmount,
    String? subTotal,
    String? total,
    String? paymentStatus,
    String? paymentId,
    String? couponCode,
  }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.makeOrder(
          token: token,
          address: address,
          paymentMethod: paymentMethod,
          shippingTotal: shippingTotal,
          subTotal: subTotal,
          total: total,
          paymentStatus: paymentStatus,
          paymentId: paymentId,
          couponCode : couponCode
        );
        if (res['success'] == true) {
          final myInfoResponse = OrderResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to create order,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to create order, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, MyFavoriteProduct?>> getMyFavoriteProducts(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getMyFavoriteProducts(token: token);
        if (res['success'] == true) {
          final dataModel = MyFavoriteProduct.fromJson(res);
          return Right(
            dataModel,
          );
        } else {
          return Left(NotFound(
              message:
                  res['message'] ?? 'Failed to get favorite product list'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(
            NotFound(message: 'Failed to get favorite product list, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, OrderSummaryModel?>> getOrderSummary(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getOrderSummary(token: token);
        if (res['success'] == true) {
          final dataModel = OrderSummaryModel.fromJson(res);
          return Right(dataModel);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to get order summary'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get order summary, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, SeeAllModel?>> seeAll(
      {required String token, required String type}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.seeAll(
          token: token,
          type: type,
        );
        if (res['success'] == true) {
          final myInfoResponse = SeeAllModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to like product,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to like product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, SeeAllModel?>> seeAllProducts(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.seeAllProducts(
          token: token,
        );
        if (res['success'] == true) {
          final myInfoResponse = SeeAllModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(
              NotFound(message: res['message'] ?? 'Failed to like product,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to like product, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> addPaymentMethod({
    required String token,
    String? name,
    String? cardNumber,
    String? expirationMonth,
    String? expirationYear,
    String? cvc,
    String? upi,
  }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.addPaymentMethod(
            token: token,
            name: name,
            cardNumber: cardNumber,
            expirationMonth: expirationMonth,
            expirationYear: expirationYear,
            cvc: cvc,
            upi: upi);
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to add payment methods,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to add payment methods, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PaymentMethod?>> getPaymentMethods(
      {required String token}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.getPaymentMethods(
          token: token,
        );
        if (res['success'] == true) {
          final myInfoResponse = PaymentMethod.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to get payment methods,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to get payment methods, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, PostResponseModel?>> updatePaymentMethod({
    required String token,
    required String type,
    required int id,
    String? name,
    String? cardNumber,
    String? expirationMonth,
    String? expirationYear,
    String? cvc,
    String? upi,
  }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.updatePaymentMethod(
            id: id,
            token: token,
            type: type,
            name: name,
            cardNumber: cardNumber,
            expirationMonth: expirationMonth,
            expirationYear: expirationYear,
            cvc: cvc,
            upi: upi);
        if (res['success'] == true) {
          final myInfoResponse = PostResponseModel.fromJson(res);
          return Right(myInfoResponse);
        } else {
          return Left(NotFound(
              message: res['message'] ?? 'Failed to update payment method,'));
        }
      } catch (e) {
        AppLogger.e(e.toString());
        return Left(NotFound(message: 'Failed to update payment method, $e'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }
}
