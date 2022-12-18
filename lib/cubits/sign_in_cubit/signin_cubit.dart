import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';

import '../../data/data_repository/app_repository.dart';
import '../../data/model/user_login_reponse_model.dart';
import '../../locator.dart';
import '../../router/app_routes.gr.dart';
import '../../router/route_names.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit()
      : super(const SignInState(isLoggedIn: false, isProcessing: false));

  final appRepository = getItInjector<AppRepository>();
  final appRouter = getItInjector<AppRouter>();

  void loginFunc() async {
    emit(state.copyWith(isProcessing: true));
    final loginRes = await appRepository.login(
      email: state.email ?? '',
      password: state.password ?? '',
    );
    loginRes.fold(
      (l) {
        error(l.message);
      },
      (r) async {
        if (r != null) {
          await GetStorage().write('token', r.token);
          success(r);
          return;
        }
        error('Failed to login');
      },
    );
  }

  void error(String? failure) {
    emit(state.copyWith(
      isProcessing: false,
      isLoggedIn: false,
    ));
    ScaffoldMessenger.of(appRouter.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(
        failure ?? 'Failed to Login!',
      ),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    ));
  }

  void success(UserLoginResponseModel r) async {
    await appRepository.setUserSessionData(user: r);
    emit(state.copyWith(
      isProcessing: false,
      isLoggedIn: true,
      user: r,
    ));
    navigate();
  }

  void navigate() {
    appRouter.navigatorKey.currentState!.context
        .read<ProfileCubit>()
        .authenticate();

    //appRouter.replaceNamed(RouteNames.homeScreen);
    ScaffoldMessenger.of(appRouter.navigatorKey.currentContext!)
        .showSnackBar(const SnackBar(
      content: Text(
        'Login Success!',
      ),
    ));
  }

  void isLoggedIn() async {
    emit(state.copyWith(isProcessing: true));
    final loginRes = await appRepository.getUserSessionData();
    loginRes.fold(
      (l) => {
        emit(state.copyWith(
          isProcessing: false,
          isLoggedIn: false,
        ))
      },
      (r) => {
        emit(state.copyWith(
          isProcessing: false,
          isLoggedIn: true,
        )),
      },
    );
  }

  void logoutSession() async {
    final logout = await appRepository.deleteUserSessionData();
    logout.fold((l) => {}, (r) {
      emit(state.copyWith(
        isLoggedIn: false,
      ));
      appRouter.replaceNamed(RouteNames.signInScreen);
    });
  }

  void onEmailInputChanged(String? value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordInputChanged(String? value) {
    emit(state.copyWith(password: value));
  }
}
