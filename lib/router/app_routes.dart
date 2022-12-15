import 'package:auto_route/annotations.dart';
import 'package:linger/ui/AboutUs.dart';
import 'package:linger/ui/AchievementsScreen.dart';
import 'package:linger/ui/course/coursescreen.dart';
import 'package:linger/ui/EditProfileScreen.dart';
import 'package:linger/ui/ReferEarnScreen.dart';
import 'package:linger/ui/signup.dart';
import 'package:linger/ui/SignUpSelectorScreen.dart';
import 'package:linger/ui/Subscription.dart';
import 'package:linger/ui/Wallet.dart';

import '../common_screen/success_screen.dart';
import '../ui/DrawerMenuScreens.dart';
import '../ui/homepage.dart';
import '../ui/loginscreen.dart';
import '../ui/SplashScreen.dart';
import '../ui/orders/order_status_screen.dart';
import '../ui/orders/order_summary_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: LoginScreen,
    ),
    AutoRoute(
      page: SignUp,
    ),
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(
      page: WelcomeScreen,
    ),
    AutoRoute(
      page: DrawerMenuScreens,
    ),
    AutoRoute(
      page: SubscriptionScreen,
    ),
    AutoRoute(
      page: AchievementsScreen,
    ),
    AutoRoute(
      page: ReferEarnScreen,
    ),
    AutoRoute(
      page: WalletScreen,
    ),
    AutoRoute(
      page: AboutUsScreen,
    ),
    AutoRoute(
      page: EditProfileScreen,
    ),
    AutoRoute(
      page: CourseScreen,
    ),
    AutoRoute(
      page: SuccessScreen,
    ),
    AutoRoute(
      page: OrderStatusScreen,
    ),
    AutoRoute(
      page: OrderSummaryScreen,
    ),
  ],
)
class $AppRouter {}
