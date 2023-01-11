import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/SignUpSelectorScreen.dart';
import 'package:linger/ui/my_animated_splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/colors.dart';

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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFE6F4A0),
              Color(0xFFFAFDDA),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/splash_logo.png", height: 5.h),
        ),
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
          backgroundColor: getColorFromHex(ColorConstants.transparent),
          splash: Image.asset("assets/images/splash_screen.gif"),
          duration: 3000,
          splashIconSize: 35.h,
          nextScreen: const WelcomeScreen(),
        ),
      ),
    );
  }
}
