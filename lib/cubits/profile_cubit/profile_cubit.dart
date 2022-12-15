import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linger/Utils/flushbar_notification.dart';
import 'package:linger/cubits/signup_cubit/signup_controller_cubit.dart';
import 'package:linger/router/route_names.dart';
import 'package:linger/services/firebase_auth_service.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../../locator.dart';
import '../../../../../router/app_routes.gr.dart';
import '../../Utils/logger_utils.dart';
import '../../Utils/progress_utility.dart';
import '../../data/data_repository/app_repository.dart';
import '../../data/model/user_login_reponse_model.dart';
import '../../data/model/user_profile_model.dart';
import '../../modals/choose_picker_moal.dart';
import '../../ui/CreateAccount.dart';
import '../../ui/OtpScreen.dart';
import 'dart:io';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.init());

  final router = getItInjector<AppRouter>();
  final dataRepo = getItInjector<AppRepository>();
  final ImagePicker _picker = ImagePicker();

  void authenticate() async {
    final response = await dataRepo.getUserSessionData();
    response.fold((l) {
      router.replaceNamed(RouteNames.welcomeScreen);
    }, (r) {
      if (r != null) {
        emit(state.copyWith(user: r));
        AppLogger.i('User Information -> ${r.toJson()}');
        getProfileDetail();
        router.replaceNamed(RouteNames.homeScreen);
      } else {}
    });
  }

  void getProfileDetail() async {
    final response =
        await dataRepo.getPersonalProfileData(token: state.user?.token ?? '');
    response.fold((l) {}, (r) {
      if (r != null) {
        emit(state.copyWith(
          personalProfileModel: r,
        ));
      } else {}
    });
  }

  void logout(BuildContext context) async {
    context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final response = await getItInjector<AppRepository>().logout();
    context.loaderOverlay.hide();
    response.fold((l) => {}, (r) {
      router.pushAndPopUntil(const LoginScreen(),
          predicate: (Route<dynamic> route) {
        return false;
      });
    });
  }

  void sendOTP(BuildContext context, String mno) async {
    emit(state.copyWith(
      mobileNumber: mno,
    ));
    context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final loginRes = await dataRepo.sendOTP(mobileNumber: mno);
    context.loaderOverlay.hide();
    loginRes.fold(
      (l) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to send OTP')));
      },
      (r) {
        if (r != null) {
          if (r.success ?? false) {
            emit(state.copyWith(
              user: UserLoginResponseModel(
                user: UserData(id: r.user?.id, otp: r.user?.otp),
              ),
              mobileNumber: mno,
            ));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${r.message}')));
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OtpScreen()));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${r.message}')));
          }
          return;
        }
      },
    );
  }

  Future<File?> pickedProfilePicFunction(BuildContext context) async {
    final imageSource = await showChoosePickerModal(context);
    String directory = "";
    if (imageSource != null) {
      final pickedImage = await _picker.pickImage(source: imageSource);
      if (pickedImage?.path != null) {
        emit(state.copyWith(
          pickedProfilePic: File(pickedImage!.path),
        ));
        return File(pickedImage.path);
      }
    }
    return null;
  }

  void verifyOTP(
    BuildContext context,
    String otp,
  ) async {
    context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final loginRes = await dataRepo.verifyOTP(
        otp: otp, userId: state.user?.user?.id.toString() ?? '');
    context.loaderOverlay.hide();
    loginRes.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to verify OTP')));
      },
      (r) {
        if (r != null) {
          if (r.status ?? false) {
            emit(state.copyWith(
                user: UserLoginResponseModel(
                    user: UserData(id: r.data?.id, otp: r.data?.otp))));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${r.massage}')));
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CreateAccount()));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${r.massage}')));
          }
          return;
        }
      },
    );
  }

  void signUpWithGoogle(BuildContext context) async {
    final signUPCubit = context.read<SignUpCubit>();
    context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final loginRes = await FirebaseService.signInWithGoogle();
    context.loaderOverlay.hide();
    if (loginRes != null) {
      if (loginRes.status == Status.success) {
        signUPCubit.onEmailChange(loginRes.data?.user?.email);
        signUPCubit.onfNameChange(loginRes.data?.user?.displayName);
        emit(state.copyWith(
          authCredentials: loginRes.data,
        ));
        final auth = await socialAuthRequest(loginRes.data!);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreateAccount()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to verify Google credential')));
      }
    }
  }

  void signUpWithFacebook(BuildContext context) async {
    final signUPCubit = context.read<SignUpCubit>();
    context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final loginRes = await FirebaseService.signInWithFacebook();
    context.loaderOverlay.hide();
    if (loginRes != null) {
      if (loginRes.status == Status.success && loginRes.data != null) {
        signUPCubit.onEmailChange(loginRes.data?.user?.email);
        signUPCubit.onfNameChange(loginRes.data?.user?.displayName);
        emit(state.copyWith(
          authCredentials: loginRes.data,
        ));
        final auth = await socialAuthRequest(loginRes.data!);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreateAccount()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to verify Facebook credential')));
      }
    }
  }

  Future<UserLoginResponseModel?> socialAuthRequest(
      auth.UserCredential userCredential) async {
    final res =
        await dataRepo.socialAuthRequest(authRequestModel: userCredential);
    res.fold((l) {
      return null;
    }, (r) {
      return r;
    });
    return null;
  }

  Future<UserLoginResponseModel?> updateProfile(BuildContext context,
      {String? name,
      String? fLink,
      String? instaLink,
      String? twitterLink}) async {
    ProgressUtil.showProgress(context: context);
    final res = await dataRepo.updateProfile(
      token: state.user?.token.toString() ?? '',
      name: name,
      fLink: fLink,
      instaLink: instaLink,
      twitterLink: twitterLink,
    );
    ProgressUtil.hideProgress();
    res.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to update profile');
      return null;
    }, (r) {
      FlushBarNotification.showSnack(
          title: r?.message ?? 'Profile updated successfully');
      return r;
    });
    return null;
  }

  Future<UserLoginResponseModel?> updateProfileImage(
    BuildContext context, {
    File? image,
  }) async {
    ProgressUtil.showProgress(context: context);
    final res = await dataRepo.updateProfileImage(
      token: state.user?.token.toString() ?? '',
      image: image,
    );
    ProgressUtil.hideProgress();
    res.fold((l) {
      FlushBarNotification.showSnack(
          title: l.message ?? 'Failed to update profile');
      return null;
    }, (r) {
      emit(state.copyWith(
        myInfo: r,
      ));
      FlushBarNotification.showSnack(
          title: 'Profile Image updated successfully');
      return r;
    });
    return null;
  }
}
