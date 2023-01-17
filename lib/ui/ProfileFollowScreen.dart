import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Controller/other_user_profile_controller.dart';
import 'package:linger/Utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileFollowScreen extends StatefulWidget {
  final String? name;
  final int? id;
  const ProfileFollowScreen({
    Key? key,
    this.name,
    this.id,
  }) : super(key: key);

  @override
  State<ProfileFollowScreen> createState() => _ProfileFollowScreenState();
}

class _ProfileFollowScreenState extends State<ProfileFollowScreen>
    with baseclass {
  OtherUserProfileController controller = Get.put(OtherUserProfileController());
  @override
  void initState() {
    controller.getData(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.name!,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.width - 150,
                      child: Stack(
                        children: [
                          controller.userData!.coverImage == null
                              ? Image.asset(
                                  'assets/images/probanners.png',
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  controller.userData!.coverImage,
                                  fit: BoxFit.fill,
                                ),
                          Positioned(
                            bottom: 0,
                            left: size.width / 2 - 62,
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: CachedNetworkImageProvider(
                                    controller.userData!.userDetail!.image),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.userData!.userDetail!.name!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    controller.userData!.userDetail!.primeStatus == 0
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.verified,
                                    color: Colors.blue, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  "Premium Account",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                    // Container(
                    //   padding: const EdgeInsets.all(5),
                    //   margin: const EdgeInsets.only(
                    //       left: 110, right: 110, top: 10, bottom: 10),
                    //   decoration: BoxDecoration(
                    //     color: getColorFromHex(ColorConstants.verifyFieldColor),
                    //     border: Border.all(
                    //         width: 1,
                    //         color: getColorFromHex(ColorConstants.verifyFieldColor)),
                    //     borderRadius: const BorderRadius.all(
                    //       Radius.circular(
                    //         20,
                    //       ),
                    //     ),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //         'assets/images/verify.png',
                    //         height: 20,
                    //         width: 20,
                    //       ),
                    //       Text(
                    //         'Premium Account',
                    //         style: TextStyle(
                    //             color: getColorFromHex(
                    //                 ColorConstants.textverifyFieldColor)),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                controller.userData!.userDetail!.totalLike!
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Likes',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${controller.userData!.userDetail!.totalFollowers!}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Followers',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                controller.userData!.userDetail!.totalFollowing
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Following',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              await controller.userFollow(widget.id!,
                                  controller.userData!.isFollow! ? 0 : 1);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15, bottom: 10),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: getColorFromHex(controller.isFollow.value
                                    ? ColorConstants.white
                                    : ColorConstants.green),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border:
                                    Border.all(width: 1, color: Colors.green),
                              ),
                              child: Text(
                                controller.isFollow.value
                                    ? 'Following'
                                    : "Follow",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: controller.isFollow.value
                                        ? Colors.green
                                        : Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.userLike(widget.id!,
                                  controller.userData!.isLike! ? 0 : 1);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: controller.isLike.value
                                      ? Colors.red.withOpacity(0.2)
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(
                                      width: controller.isLike.value ? 0 : 1,
                                      color: Colors.grey),
                                ),
                                child: controller.isLike.value
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.grey,
                                      )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: controller.userData!.userDetail!
                                        .fecebookAccountLink ==
                                    null
                                ? null
                                : () {
                                    _launchUrl(controller.userData!.userDetail!
                                        .fecebookAccountLink!);
                                  },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.greyBackgroundScreen),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Image.asset(
                                'assets/images/f.png',
                                width: 18.75,
                                height: 18.75,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: controller.userData!.userDetail!
                                        .instagramAccountLink ==
                                    null
                                ? null
                                : () {
                                    _launchUrl(controller.userData!.userDetail!
                                        .instagramAccountLink!);
                                  },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.greyBackgroundScreen),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Image.asset(
                                'assets/images/i.png',
                                width: 18.75,
                                height: 18.75,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: controller.userData!.userDetail!
                                        .twitterAccountLink ==
                                    null
                                ? null
                                : () {
                                    _launchUrl(controller.userData!.userDetail!
                                        .twitterAccountLink!);
                                  },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.greyBackgroundScreen),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Image.asset(
                                'assets/images/t.png',
                                width: 18.75,
                                height: 18.75,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: getColorFromHex(
                                  ColorConstants.greyBackgroundScreen),
                              width: 1)),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Activity',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 3, bottom: 3),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: getColorFromHex(
                                        ColorConstants.greyBackgroundScreen),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                  ),
                                  child: const Text(
                                    '6',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/greycheck.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                SizedBox(
                                  width: size.width * 0.6,
                                  child: const Text(
                                    'Completed Surah Rahman',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/greycheck.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Passed the Quiz',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/greycheck.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Started a new Course',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 120),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                    //   child: Column(
                    //     children: [
                    //       ExpandableTheme(
                    //         data: const ExpandableThemeData(
                    //           iconColor: Colors.blue,
                    //           useInkWell: true,
                    //         ),
                    //         child: ListView(
                    //           physics: const BouncingScrollPhysics(),
                    //           children: <Widget>[
                    //             Card1(),
                    //             Card2(),
                    //             Card3(),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //     vertical: 10,
                    //   ),
                    //   margin: const EdgeInsets.all(20),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     border: Border.all(
                    //         width: 1,
                    //         color: getColorFromHex(
                    //             ColorConstants.greyBackgroundScreen)),
                    //     borderRadius: const BorderRadius.all(
                    //       Radius.circular(10),
                    //     ),
                    //   ),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text(
                    //           'Achievements',
                    //           style:
                    //               TextStyle(fontSize: 20, color: Colors.black),
                    //         ),
                    //         const SizedBox(
                    //           height: 6,
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               padding: const EdgeInsets.only(
                    //                 left: 8,
                    //                 right: 8,
                    //                 top: 12,
                    //                 bottom: 12,
                    //               ),
                    //               margin: const EdgeInsets.all(5),
                    //               color: getColorFromHex(
                    //                   ColorConstants.greyBackgroundScreen),
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
                    //               color: getColorFromHex(
                    //                   ColorConstants.greyBackgroundScreen),
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
                    //               color: getColorFromHex(
                    //                   ColorConstants.greyBackgroundScreen),
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
            )),
    );
  }

  Future _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
