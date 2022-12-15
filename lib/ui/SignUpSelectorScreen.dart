import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/loginscreen.dart';
import 'package:linger/ui/signup.dart';
import 'package:linger/Utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with baseclass {
  @override
  void initState() {
    // TODO: implement initState
    //initAppState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 38.5.w,
                    width: 38.5.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 5.9.h,
                  ),
                  Text(
                    "Welcome to Linger",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 3.5.h, horizontal: 4.w),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: Container(
                      width: size.width,
                      height: 6.4.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: getColorFromHex(ColorConstants.green),
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      width: size.width,
                      height: 6.4.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.sp),
                        border: Border.all(
                          color: getColorFromHex(ColorConstants.green),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.green, fontSize: 17.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
