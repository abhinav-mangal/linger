import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/AssetImage.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/EditProfileScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/profile_controller.dart';
import '../Utils/customText.dart';
import '../cubits/profile_cubit/profile_cubit.dart';

class ProfileFreeScreen extends StatefulWidget {
  const ProfileFreeScreen({Key? key}) : super(key: key);

  @override
  State<ProfileFreeScreen> createState() => _ProfileFreeScreenState();
}

class _ProfileFreeScreenState extends State<ProfileFreeScreen> with baseclass {
  late final ProfileCubit profileCubit;
  ProfileController controller = Get.put(ProfileController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   profileCubit = context.read<ProfileCubit>();
  //   if (profileCubit.state.user == null) {
  //     profileCubit.getProfileDetail();
  //   }
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    controller.getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      var use = controller.profileData;
      return Scaffold(
          backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
          body: controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(
                    radius: 30,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: gettoppadding(context)),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: getW(16), right: getW(16), bottom: getH(15)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: getH(15)),
                            child: Row(
                              children: [
                                CustomText(
                                  textalign: TextAlign.center,
                                  text: "Profile",
                                  familytype: 6,
                                  textsize: 26.sp,
                                  // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                  textcolor:
                                      getColorFromHex(ColorConstants.black),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: getH(40),
                                    width: getH(40),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getColorFromHex(ColorConstants
                                              .buttonBackgroundColorsGray)
                                          .withOpacity(0.08),
                                    ),
                                    padding: EdgeInsets.all(getH(11)),
                                    child: MyAssetImage(
                                      imageName: "settings.png",
                                      width: getH(18),
                                      height: getH(18),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width,
                            height: getH(180),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double innerHeight = constraints.maxHeight;
                                double innerWidth = constraints.maxWidth;
                                return Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: SizedBox(
                                          width: innerWidth,
                                          height: innerHeight,
                                          child: use!.coverImage == null
                                              ? Image.asset(
                                                  'assets/images/probanner.png')
                                              : CachedNetworkImage(
                                                  imageUrl: use
                                                      .coverImage!['image'])),
                                    ),
                                    Positioned(
                                      top: innerHeight / 2 + getW(4),
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: innerWidth / 3.7,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: getW(4),
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: innerWidth / 7.4,
                                          foregroundImage:
                                              CachedNetworkImageProvider(
                                                  use.user!.image != null
                                                      ? use.user!.image!
                                                      : "12"),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          // SizedBox(
                          //   width: size.width,
                          //   height: getH(180),
                          //   child: Stack(
                          //     clipBehavior: Clip.none,
                          //     children: [
                          //       SizedBox(
                          //         width: size.width,
                          //         height: getH(180),
                          //         child: Image.asset(
                          //           'assets/images/probanner.png',
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //       Align(
                          //         alignment: Alignment.center,
                          //         child: Container(
                          //           // width: getW(96),
                          //           child: CircleAvatar(
                          //             radius: getW(45),
                          //             backgroundImage: ExactAssetImage(
                          //                 'assets/images/m.png'),
                          //           ),
                          //           decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             border: Border.all(
                          //               color: Colors.white,
                          //               width: getW(4),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: getH(73),
                          ),
                          CustomText(
                            textalign: TextAlign.center,
                            text: use!.user!.name!,
                            familytype: 3,
                            textsize: 20.sp,
                            // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                            textcolor: getColorFromHex(ColorConstants.black),
                          ),
                          use.user!.primeStatus == 0
                              ? Container()
                              : Image.asset('assets/images/prime.png'),
                          Container(
                            margin: EdgeInsets.only(top: getH(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getW(118),
                                  height: getH(48),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: "${use.user!.totalLike ?? 0}",
                                        familytype: 6,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                            ColorConstants.black),
                                      ),
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: "Likes",
                                        familytype: 1,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                                ColorConstants.greycolor)
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: getW(118),
                                  height: getH(48),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text:
                                            "${use.user!.totalFollowers ?? 0}",
                                        familytype: 6,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                            ColorConstants.black),
                                      ),
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: "Followers",
                                        familytype: 1,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                                ColorConstants.greycolor)
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: getW(118),
                                  height: getH(48),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text:
                                            "${use.user!.totalFollowing ?? 0}",
                                        familytype: 6,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                            ColorConstants.black),
                                      ),
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: "Following",
                                        familytype: 1,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                                ColorConstants.greycolor)
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: getH(26)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: use.user!.fecebookAccountLink == null
                                      ? null
                                      : () {
                                          _launchUrl(
                                              use.user!.fecebookAccountLink!);
                                        },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(getH(11)),
                                    margin: EdgeInsets.only(right: getW(24)),
                                    child: Image.asset(
                                      'assets/images/f.png',
                                      width: getH(19),
                                      height: getH(19),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: use.user!.instagramAccountLink == null
                                      ? null
                                      : () {
                                          _launchUrl(
                                              use.user!.instagramAccountLink!);
                                        },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(getH(11)),
                                    margin: EdgeInsets.only(right: getW(24)),
                                    child: Image.asset(
                                      'assets/images/i.png',
                                      width: getH(19),
                                      height: getH(19),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: use.user!.twitterAccountLink == null
                                      ? null
                                      : () {
                                          _launchUrl(
                                              use.user!.twitterAccountLink!);
                                        },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(getH(11)),
                                    child: Image.asset(
                                      'assets/images/t.png',
                                      width: getH(19),
                                      height: getH(19),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getH(20),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: getW(32.5),
                                  right: getW(32.5),
                                  top: getH(12),
                                  bottom: getH(12)),
                              margin: EdgeInsets.only(bottom: getH(32)),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.greyBackgroundScreen),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                                border: Border.all(
                                    width: getW(0.5), color: Colors.grey),
                              ),
                              child: CustomText(
                                textalign: TextAlign.center,
                                text: "Edit Profile",
                                familytype: 1,
                                textsize: 13.sp,
                                // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                              ),
                            ),
                          ),
                          Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.sp)),
                                border: Border.all(
                                    color: getColorFromHex(
                                        ColorConstants.greyBackgroundScreen),
                                    width: 1)),
                            padding: EdgeInsets.only(
                                left: getW(16),
                                right: getW(16),
                                top: getH(12),
                                bottom: getH(12)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      textalign: TextAlign.center,
                                      text: "Activity",
                                      familytype: 2,
                                      textsize: 18.sp,
                                      // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                      textcolor:
                                          getColorFromHex(ColorConstants.black),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: getW(12),
                                          right: getW(12),
                                          top: getH(2),
                                          bottom: getH(2)),
                                      margin: EdgeInsets.only(left: getW(8)),
                                      decoration: BoxDecoration(
                                        color: getColorFromHex(ColorConstants
                                            .greyBackgroundScreen),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(22.sp),
                                        ),
                                      ),
                                      child: CustomText(
                                        textalign: TextAlign.center,
                                        text: "6",
                                        familytype: 1,
                                        textsize: 13.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                            ColorConstants.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getH(20),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: getH(5),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/greycheck.png',
                                        height: getH(20),
                                        width: getH(20),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: 'Completed Surah Rahman',
                                        familytype: 1,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                                ColorConstants.greycolor)
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: getH(5),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/greycheck.png',
                                        height: getH(20),
                                        width: getH(20),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: 'Passed the Quiz',
                                        familytype: 1,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                                ColorConstants.greycolor)
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: getH(5),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/greycheck.png',
                                        height: getH(20),
                                        width: getH(20),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      CustomText(
                                        textalign: TextAlign.center,
                                        text: 'Started a new Course',
                                        familytype: 1,
                                        textsize: 15.sp,
                                        // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                                        textcolor: getColorFromHex(
                                                ColorConstants.greycolor)
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 120),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Show all',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 10,
                          //     vertical: 10,
                          //   ),
                          //   margin: const EdgeInsets.all(20),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     border: Border.all(
                          //       width: 1,
                          //       color: getColorFromHex(
                          //           ColorConstants.greyBackgroundScreen),
                          //     ),
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(10),
                          //     ),
                          //   ),
                          //   child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         const Text(
                          //           'Achievements',
                          //           style: TextStyle(
                          //               fontSize: 20, color: Colors.black),
                          //         ),
                          //         const SizedBox(
                          //           height: 6,
                          //         ),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                 left: 8,
                          //                 right: 8,
                          //                 top: 12,
                          //                 bottom: 12,
                          //               ),
                          //               margin: const EdgeInsets.all(5),
                          //               color: getColorFromHex(ColorConstants
                          //                   .greyBackgroundScreen),
                          //               child: Column(
                          //                 children: [
                          //                   Image.asset(
                          //                     'assets/images/flag.png',
                          //                     height: 48,
                          //                     width: 48,
                          //                   ),
                          //                   const SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   const Text(
                          //                     'Achiever',
                          //                     style: TextStyle(
                          //                         fontSize: 17,
                          //                         fontWeight: FontWeight.w400,
                          //                         color: Colors.grey),
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                 left: 8,
                          //                 right: 8,
                          //                 top: 12,
                          //                 bottom: 12,
                          //               ),
                          //               margin: const EdgeInsets.all(5),
                          //               color: getColorFromHex(ColorConstants
                          //                   .greyBackgroundScreen),
                          //               child: Column(
                          //                 children: [
                          //                   Image.asset(
                          //                     'assets/images/badge.png',
                          //                     height: 48,
                          //                     width: 48,
                          //                   ),
                          //                   const SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   const Text(
                          //                     'Glorious',
                          //                     style: TextStyle(
                          //                         fontSize: 17,
                          //                         fontWeight: FontWeight.w400,
                          //                         color: Colors.grey),
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                 left: 8,
                          //                 right: 8,
                          //                 top: 12,
                          //                 bottom: 12,
                          //               ),
                          //               margin: const EdgeInsets.all(5),
                          //               color: getColorFromHex(ColorConstants
                          //                   .greyBackgroundScreen),
                          //               child: Column(
                          //                 children: [
                          //                   Image.asset(
                          //                     'assets/images/medal.png',
                          //                     height: 48,
                          //                     width: 48,
                          //                   ),
                          //                   const SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   const Text(
                          //                     'Collector',
                          //                     style: TextStyle(
                          //                         fontSize: 17,
                          //                         fontWeight: FontWeight.w400,
                          //                         color: Colors.grey),
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ]),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ));
    });
  }

  Future _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
