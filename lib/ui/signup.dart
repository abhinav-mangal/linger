import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/cubits/signup_cubit/signup_controller_cubit.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/MobileScreen.dart';
import 'package:linger/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../cubits/profile_cubit/profile_cubit.dart';
import '../router/route_names.dart';
import 'loginscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with baseclass {
  late final ProfileCubit profileCubit;
  Decoration dec = const BoxDecoration();

  @override
  void initState() {
    // TODO: implement initState
    profileCubit = context.read<ProfileCubit>();
    dec = BoxDecoration(
      color: Colors.white,
      border: Border.all(
          width: 1,
          color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // boxShadow: [
      //   BoxShadow(
      //     color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3),
      //     spreadRadius: 2,
      //     blurRadius: 3,
      //     offset: const Offset(0, 1), // changes position of shadow
      //   ),
      // ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return LoaderOverlay(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.fromLTRB(4.w, 8.4.h, 0, 0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 7.6.h,
                        width: 7.6.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Sign up for Linger",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(4.w, 4.7.h, 4.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
                          decoration: dec,
                          child: socialmediabutton(
                              'person.png', "SignUp with Email & Phone", () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MobileScreen()));
                          }, getColorFromHex(ColorConstants.greycolor), false),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
                          decoration: dec,
                          child: socialmediabutton('Glogo.png', "Google", () {
                            profileCubit.signUpWithGoogle(context);
                          }, getColorFromHex(ColorConstants.greycolor), false),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
                          decoration: dec,
                          child:
                              socialmediabutton('Fblogo.png', "Facebook", () {
                            profileCubit.signUpWithFacebook(context);
                          }, getColorFromHex(ColorConstants.greycolor), false),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => const MobileScreen()));
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     margin:  EdgeInsets.symmetric(vertical: 1.h),
                        //     // padding: const EdgeInsets.all(7.5),
                        //     height: 5.92.h,
                        //     decoration: BoxDecoration(
                        //         borderRadius: const BorderRadius.all(Radius.circular(10)),
                        //         border: Border.all(color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3), width: 1)
                        //     ),
                        //     child: ListTile(
                        //       visualDensity: const VisualDensity(
                        //         vertical: -4,
                        //       ),
                        //       leading: Container(
                        //         height: 2.84.h,
                        //         width: 2.84.h,
                        //         margin: EdgeInsets.only(left: 2.w),
                        //         child: Image.asset(
                        //           'assets/images/person.png',
                        //           height: 2.84.h,
                        //           width: 2.84.h,
                        //         ),
                        //       ),
                        //
                        //       title: Container(
                        //         width: 77.4.w,
                        //         margin: EdgeInsets.only(right: 4.w),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.center,
                        //           children: [
                        //             CustomText(
                        //               text: "SignUp with Email & Phone ",
                        //               familytype: 1,
                        //               linecount: 1,
                        //               textcolor: Colors.black,
                        //               // marginvalue: EdgeInsets.only(left: 6.w),
                        //               textsize: 16.sp,
                        //               // align: Alignment.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     profileCubit.signUpWithGoogle(context);
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     margin:  EdgeInsets.symmetric(vertical: 1.h),
                        //     // padding: const EdgeInsets.all(7.5),
                        //     height: 5.92.h,
                        //     decoration: BoxDecoration(
                        //         borderRadius: const BorderRadius.all(Radius.circular(10)),
                        //         border: Border.all(color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3), width: 1)
                        //     ),
                        //     child: ListTile(
                        //       visualDensity: const VisualDensity(
                        //         vertical: -4,
                        //       ),
                        //       leading: Container(
                        //         height: 2.84.h,
                        //         width: 2.84.h,
                        //         margin: EdgeInsets.only(left: 2.w),
                        //         child: Image.asset(
                        //           'assets/images/Glogo.png',
                        //           height: 2.84.h,
                        //           width: 2.84.h,
                        //         ),
                        //       ),
                        //
                        //       title: Container(
                        //         width: 77.4.w,
                        //         margin: EdgeInsets.only(right: 4.w),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.center,
                        //           children: [
                        //             CustomText(
                        //               text:  "Google",
                        //               familytype: 1,
                        //               linecount: 1,
                        //               textcolor: Colors.black,
                        //               // marginvalue: EdgeInsets.only(left: 6.w),
                        //               textsize: 16.sp,
                        //               // align: Alignment.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     profileCubit.signUpWithFacebook(context);
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     margin:  EdgeInsets.symmetric(vertical: 1.h),
                        //     // padding: const EdgeInsets.all(7.5),
                        //     height: 5.92.h,
                        //     decoration: BoxDecoration(
                        //         borderRadius: const BorderRadius.all(Radius.circular(10)),
                        //         border: Border.all(color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3), width: 1)
                        //     ),
                        //     child: ListTile(
                        //       visualDensity: const VisualDensity(
                        //         vertical: -4,
                        //       ),
                        //       leading: Container(
                        //         height: 2.84.h,
                        //         width: 2.84.h,
                        //         margin: EdgeInsets.only(left: 2.w),
                        //         child: Image.asset(
                        //           'assets/images/Fblogo.png',
                        //           height: 2.84.h,
                        //           width: 2.84.h,
                        //         ),
                        //       ),
                        //
                        //       title: Container(
                        //         width: 77.4.w,
                        //         margin: EdgeInsets.only(right: 4.w),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.center,
                        //           children: [
                        //             CustomText(
                        //               text:  "Facebook ",
                        //               familytype: 1,
                        //               linecount: 1,
                        //               textcolor: Colors.black,
                        //               // marginvalue: EdgeInsets.only(left: 6.w),
                        //               textsize: 16.sp,
                        //               // align: Alignment.center,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 4.w, right: 4.w, top: 2.79.h),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'By Sign In & Sign Up you agree to our ',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Terms of Service.',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            final router = getItInjector<AppRouter>();
            router.pushNamed(RouteNames.signInScreen);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 5.6.h),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: Colors.black, fontSize: 17.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Login',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.green)),
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }
}
