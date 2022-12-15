// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:linger/common_screen/successParam.dart';
import 'package:linger/ui/AboutUs.dart' as _i11;
import 'package:linger/ui/AchievementsScreen.dart' as _i8;
import 'package:linger/ui/course/coursescreen.dart' as _i13;
import 'package:linger/ui/DrawerMenuScreens.dart' as _i6;
import 'package:linger/ui/EditProfileScreen.dart' as _i12;
import 'package:linger/ui/homepage.dart' as _i4;
import 'package:linger/ui/loginscreen.dart' as _i2;
import 'package:linger/ui/ReferEarnScreen.dart' as _i9;
import 'package:linger/ui/signup.dart' as _i3;
import 'package:linger/ui/SignUpSelectorScreen.dart' as _i5;
import 'package:linger/ui/SplashScreen.dart' as _i1;
import 'package:linger/ui/Subscription.dart' as _i7;
import 'package:linger/ui/Wallet.dart' as _i10;
import '../common_screen/success_screen.dart' as _i17;
import '../ui/orders/order_status_screen.dart' as _i16;
import '../ui/orders/order_summary_screen.dart' as _i18;

late SuccessScreenParams? parameters;
String? orderId;
int? index;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  AppRouter.getParameters(
      {SuccessScreenParams? params, String? oid, int? Index}) {
    parameters = params;
    orderId = oid;
    index = Index;
  }

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.LoginScreen());
    },
    SignUp.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SignUp());
    },
    HomeRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.HomePage(index: index));
    },
    WelcomeScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.WelcomeScreen());
    },
    DrawerMenuScreens.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.DrawerMenuScreens());
    },
    SubscriptionScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.SubscriptionScreen());
    },
    AchievementsScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.AchievementsScreen());
    },
    ReferEarnScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.ReferEarnScreen());
    },
    WalletScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.WalletScreen());
    },
    AboutUsScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.AboutUsScreen());
    },
    EditProfileScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.EditProfileScreen());
    },
    CourseScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.CourseScreen());
    },
    OrderStatusScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.OrderStatusScreen(
            oid: orderId ?? "",
          ));
    },
    SuccessScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: _i17.SuccessScreen(params: parameters));
    },
    OrderSummaryScreen.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
          routeData: routeData, child: _i18.OrderSummaryScreen());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashScreen.name, path: '/'),
        _i14.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i14.RouteConfig(SignUp.name, path: '/sign-up'),
        _i14.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i14.RouteConfig(WelcomeScreen.name, path: '/welcome-screen'),
        _i14.RouteConfig(DrawerMenuScreens.name, path: '/drawer-menu-screens'),
        _i14.RouteConfig(SubscriptionScreen.name, path: '/subscription-screen'),
        _i14.RouteConfig(AchievementsScreen.name, path: '/achievements-screen'),
        _i14.RouteConfig(ReferEarnScreen.name, path: '/refer-earn-screen'),
        _i14.RouteConfig(WalletScreen.name, path: '/wallet-screen'),
        _i14.RouteConfig(AboutUsScreen.name, path: '/about-us-screen'),
        _i14.RouteConfig(EditProfileScreen.name, path: '/edit-profile-screen'),
        _i14.RouteConfig(CourseScreen.name, path: '/course-screen'),
        _i14.RouteConfig(SuccessScreen.name, path: '/success-screen'),
        _i14.RouteConfig(OrderStatusScreen.name,
            path: '/purchaseSummary-screen'),
        _i14.RouteConfig(OrderSummaryScreen.name, path: '/orderSummary-screen')
      ];
}

//  static String successPayment = '/success-screen';
//   static String purchaseSummary = '/purchaseSummary-screen';
/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i14.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i14.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i14.PageRouteInfo<void> {
  const SignUp() : super(SignUp.name, path: '/sign-up');

  static const String name = 'SignUp';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({int? index}) : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeScreen extends _i14.PageRouteInfo<void> {
  const WelcomeScreen() : super(WelcomeScreen.name, path: '/welcome-screen');

  static const String name = 'WelcomeScreen';
}

/// generated route for
/// [_i6.DrawerMenuScreens]
class DrawerMenuScreens extends _i14.PageRouteInfo<void> {
  const DrawerMenuScreens()
      : super(DrawerMenuScreens.name, path: '/drawer-menu-screens');

  static const String name = 'DrawerMenuScreens';
}

/// generated route for
/// [_i7.SubscriptionScreen]
class SubscriptionScreen extends _i14.PageRouteInfo<void> {
  const SubscriptionScreen()
      : super(SubscriptionScreen.name, path: '/subscription-screen');

  static const String name = 'SubscriptionScreen';
}

/// generated route for
/// [_i8.AchievementsScreen]
class AchievementsScreen extends _i14.PageRouteInfo<void> {
  const AchievementsScreen()
      : super(AchievementsScreen.name, path: '/achievements-screen');

  static const String name = 'AchievementsScreen';
}

/// generated route for
/// [_i9.ReferEarnScreen]
class ReferEarnScreen extends _i14.PageRouteInfo<void> {
  const ReferEarnScreen()
      : super(ReferEarnScreen.name, path: '/refer-earn-screen');

  static const String name = 'ReferEarnScreen';
}

/// generated route for
/// [_i10.WalletScreen]
class WalletScreen extends _i14.PageRouteInfo<void> {
  const WalletScreen() : super(WalletScreen.name, path: '/wallet-screen');

  static const String name = 'WalletScreen';
}

/// generated route for
/// [_i11.AboutUsScreen]
class AboutUsScreen extends _i14.PageRouteInfo<void> {
  const AboutUsScreen() : super(AboutUsScreen.name, path: '/about-us-screen');

  static const String name = 'AboutUsScreen';
}

/// generated route for
/// [_i12.EditProfileScreen]
class EditProfileScreen extends _i14.PageRouteInfo<void> {
  const EditProfileScreen()
      : super(EditProfileScreen.name, path: '/edit-profile-screen');

  static const String name = 'EditProfileScreen';
}

/// generated route for
/// [_i13.CourseScreen]
class CourseScreen extends _i14.PageRouteInfo<void> {
  const CourseScreen() : super(CourseScreen.name, path: '/course-screen');

  static const String name = 'CourseScreen';
}

/// generated route for
/// [_i16.OrderStatusScreen]
class OrderStatusScreen extends _i14.PageRouteInfo<void> {
  const OrderStatusScreen({String? oid})
      : super(OrderStatusScreen.name, path: '/purchaseSummary-screen');

  static const String name = 'PurchaseSummary';
}

/// generated route for
/// [_i17.SuccessScreen]
class SuccessScreen extends _i14.PageRouteInfo<void> {
  const SuccessScreen({SuccessScreenParams? params})
      : super(SuccessScreen.name, path: '/success-screen');

  static const String name = 'SuccessScreen';
}

/// generated route for
/// [_i18.OrderSummaryScreen]
class OrderSummaryScreen extends _i14.PageRouteInfo<void> {
  const OrderSummaryScreen()
      : super(OrderSummaryScreen.name, path: '/orderSummary-screen');

  static const String name = 'OrderSummary';
}
