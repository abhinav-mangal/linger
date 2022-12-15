import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linger/Utils/logger_utils.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/router/route_names.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../data/data_repository/app_repository.dart';
import '../../locator.dart';
import '../../modals/choose_picker_moal.dart';
import '../../router/app_routes.gr.dart';

part 'signup_controller_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit()
      : super(const SignUpState.init(
            obSecurePassword: true,
            visiblePassword: false,
            visibleConfirmPassword: false));

  final ImagePicker _picker = ImagePicker();

  final router = getItInjector<AppRouter>();
  final dataRepo = getItInjector<AppRepository>();

  String? validateName(String? value) {
    if (value == null) {
      return 'First name is required';
    } else if (value.isEmpty) {
      return 'First name is required';
    } else if (value.length < 2) {
      return "Invalid Name";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value == null) {
      return 'Email is required';
    }
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    String pattern =
        r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})';
    if (value == null) {
      return 'Password is required';
    }
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Password is required ';
    } else if (!regExp.hasMatch(value)) {
      return "Password should be contains character, special character and numeric value";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value) {
    String pattern =
        r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})';
    if (value == null) {
      return 'Confirm password is required';
    }
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Confirm password is required';
    } else if (!regExp.hasMatch(value)) {
      return "Password should be contains character, special character and numeric value";
    } else if (state.password != state.confirmPassword) {
      return "Please Make Sure Password Match";
    } else {
      return null;
    }
  }

  void onfNameChange(String? name) {
    emit(state.copyWith(fname: name));
  }

  void onlNameChange(String? name) {
    emit(state.copyWith(lname: name));
  }

  void onEmailChange(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChange(String? password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChange(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void changePasswordVisibility() {
    emit(state.copyWith(
      visiblePassword: !state.visiblePassword,
    ));
  }

  void changeConfirmPasswordVisibility() {
    emit(state.copyWith(
      visibleConfirmPassword: !state.visibleConfirmPassword,
    ));
  }

  void pickProfileImage(BuildContext context) async {
    final imageSource = await showChoosePickerModal(context);
    if (imageSource != null) {
      final pickedImage = await _picker.pickImage(source: imageSource);
      if (pickedImage?.path != null) {
        emit(state.copyWith(
          pickedProfilePic: File(pickedImage!.path),
        ));
      }
    }
  }

  void createAccount(BuildContext context) async {
    final profileC = context.read<ProfileCubit>();
    final mno = profileC.state.user?.user?.mobileNo ??
        profileC.state.mobileNumber ??
        '';
    AppLogger.i('MNO -> $mno');
    context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final signupRes = await dataRepo.register(
      firstName: state.fname ?? '',
      lastName: state.lname ?? '',
      emailId: state.email ?? '',
      mobileNo: mno,
      password: state.password ?? '',
    );
    context.loaderOverlay.hide();
    signupRes.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.message ?? 'Failed to Sign Up')));
      },
      (r) {
        if (r.isSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(r.message)));
          router.replaceNamed(RouteNames.signInScreen);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(r.message)));
        }
        return;
      },
    );
  }
}
