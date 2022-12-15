import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/ui/AchievementsScreen.dart';
import 'package:linger/ui/ReferEarnScreen.dart';
import 'package:linger/ui/Wallet.dart';
import 'package:linger/ui/quize/leaderboardscreen.dart';
import 'package:linger/ui/university/subscription_plan_screen.dart';
import 'package:linger/ui/widgets/web_view.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/customText.dart';
import 'ProfileFreeScreen.dart';
import 'morescreen.dart';

class DrawerMenuScreens extends StatefulWidget {
  const DrawerMenuScreens({Key? key}) : super(key: key);

  @override
  State<DrawerMenuScreens> createState() => _DrawerMenuScreensState();
}

class _DrawerMenuScreensState extends State<DrawerMenuScreens> with baseclass {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    // TODO: implement initState
    profileCubit = context.read<ProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoaderOverlay(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: gettoppadding(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        padding: EdgeInsets.only(left: 4.w),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 22.sp,
                        ),
                      ),
                      CustomText(
                        textalign: TextAlign.start,
                        align: Alignment.topLeft,
                        text: "Menu",
                        familytype: 6,
                        textsize: 22.sp,
                        marginvalue: EdgeInsets.only(
                          left: getW(10),
                        ),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(4.w, 2.84.h, 4.w, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Moredetails('profile 1.png', "Profile", () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileFreeScreen()));
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('Leaderboard 1.png', "Leaderboard", () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LeaderBoardScreen()));
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('membership 1.png', "Membership", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const SubscriptionPlanScreen()));
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('achievement 1.png', "Achievements", () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const AchievementsScreen()));
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'Reward 1.png',
                            "Reward",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('Refer 1.png', "Refer & Earn", () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ReferEarnScreen()));
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('Wallet 1.png', "Wallet", () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const WalletScreen()));
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('terms 1.png', "Terms & Condition", () {
                          navigateToWebScreen(
                              context,
                              'http://lingerofficial.in/web/termcondition',
                              'Terms & Condition');
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('privacy policy 1.png', "Privacy & Policy",
                            () {
                          navigateToWebScreen(
                              context,
                              'http://lingerofficial.in/web/privacy',
                              'Privacy & Policy');
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'setting 1.png',
                            "Setting",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('info 1.png', "About Us", () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const AboutUsScreen()));
                          navigateToWebScreen(
                              context,
                              'http://lingerofficial.in/web/showabout',
                              'About Us');
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails('Logout 1.png', "Log Out", () {
                          profileCubit.logout(context);
                        },
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                      ],
                    )),
              ])),
    );
  }

  Future<void> navigateToWebScreen(
      BuildContext context, String link, String title) async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WebViewScreen(
              url: link,
              title: title,
            )));
  }
}
