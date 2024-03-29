import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Controller/profile_controller.dart';
import 'package:linger/Utils/AssetImage.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/customText.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with baseclass {
  final nameInputController = TextEditingController();
  final facebookLinkInputController = TextEditingController();
  final instagramLinkInputController = TextEditingController();
  final twitterLinkInputController = TextEditingController();
  File? profilepic;

  ProfileController controller = Get.put(ProfileController());
  @override
  void initState() {
    nameInputController.text = controller.name;
    facebookLinkInputController.text = controller.facebookLink;
    instagramLinkInputController.text = controller.instagramLink;
    twitterLinkInputController.text = controller.twitterLink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8.2.h,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              color: Colors.transparent,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 0.0, 4.w, 0.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  ))),
        ),
        titleSpacing: 7.3.w,
        title: CustomText(
          text: 'Edit Profile',
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          // marginvalue: EdgeInsets.only(left: 16.0),
          textsize: 20.sp,
          align: Alignment.centerLeft,
        ),
        actions: [
          GetBuilder<ProfileController>(
            init: ProfileController(),
            initState: (_) {},
            builder: (controller) {
              return InkWell(
                onTap: () {
                  if (nameInputController.text.isNotEmpty) {
                    controller.updateProfile({
                      "name": nameInputController.text,
                      "fecebook_account_link": facebookLinkInputController.text,
                      "instagram_account_link":
                          instagramLinkInputController.text,
                      "twitter_account_link": twitterLinkInputController.text,
                    },
                        token: "${GetStorage().read('token')}",
                        context: context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'SAVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ),
              );
            },
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 8.2.w,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: getH(40)),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Choose a cover image (optional)',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              GetBuilder<ProfileController>(
                init: ProfileController(),
                initState: (_) {},
                builder: (cnt) {
                  return CarouselSlider.builder(
                    itemCount: cnt.cover.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        CachedNetworkImage(
                            imageUrl: cnt.cover[itemIndex].image!),
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        cnt.updateCover({'image_id': "${cnt.cover[index].id}"});
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                // color: Colors.blue,
                width: size.width,
                // height: size.width - 280,
                child: Stack(children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: CircleAvatar(
                          radius: getW(48),
                          backgroundColor: Colors.white,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                  radius: getW(48),
                                  backgroundColor: Colors.white,
                                  foregroundImage: CachedNetworkImageProvider(
                                      controller.profileData!.user!.image !=
                                              null
                                          ? controller.profileData!.user!.image!
                                          : "12")),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () async {
                                    // profileCubit
                                    //     .pickedProfilePicFunction(context)
                                    //     .then((value) {
                                    //   profileCubit.updateProfileImage(context,
                                    //       image: value!);
                                    // });

                                    controller.updateImage(body: {
                                      'Authorization':
                                          'Bearer ${GetStorage().read('token')}'
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: getH(16),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.edit,
                                        size: 16.sp,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Display name (optional)',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "${controller.profileData!.user!.name}",
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                      ),
                      controller: nameInputController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Facebook',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(12.5),
                          child: Image.asset(
                            'assets/images/f.png',
                            height: 10.0,
                            width: 10.0,
                          ),
                        ),
                        hintText: 'Enter your Facebook link here',
                      ),
                      controller: facebookLinkInputController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Instagram',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(12.5),
                          child: Image.asset(
                            'assets/images/i.png',
                            height: 10.0,
                            width: 10.0,
                          ),
                        ),
                        hintText: 'Enter your Instagram link here',
                      ),
                      controller: instagramLinkInputController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Twitter',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(12.5),
                          child: Image.asset(
                            'assets/images/t.png',
                            height: 10.0,
                            width: 10.0,
                          ),
                        ),
                        hintText: 'Enter your Twitter link here',
                      ),
                      controller: twitterLinkInputController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
