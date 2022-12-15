import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'SignUpSelectorScreen.dart';
import 'my_animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with baseclass, TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    //initAppState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SizeTransition(
          //   child: Image.asset('assets/images/gradient_logo.png'),
          //   axisAlignment: -0.5,
          //   sizeFactor: CurvedAnimation(
          //     curve: Curves.fastOutSlowIn,
          //     parent: controller,
          //   ),
          // ),
          MyAnimatedSplashScreen(
        backgroundColor: getColorFromHex(ColorConstants.primary),
        splash: Image.asset("assets/images/gradient_logo.png"),
        duration: 2500,
        splashIconSize: 25.h,
        nextScreen: const WelcomeScreen(),
      ),
    );
  }
}
