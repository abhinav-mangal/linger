import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:linger/Utils/videowidget.dart';
import 'package:linger/ui/university/libraryscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../course/coursescreen.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> with baseclass {
  final sliderImage = [
    'https://img.freepik.com/premium-photo/humbold-university-jurisdiction-faculty-berlin_87646-4312.jpg?w=2000',
    'https://img.freepik.com/premium-photo/humbold-university-jurisdiction-faculty-berlin_87646-4312.jpg?w=2000',
    'https://img.freepik.com/premium-photo/humbold-university-jurisdiction-faculty-berlin_87646-4312.jpg?w=2000',
    'https://img.freepik.com/premium-photo/humbold-university-jurisdiction-faculty-berlin_87646-4312.jpg?w=2000',
  ];
  String url =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  final currentPage = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.fromLTRB(4.w, gettoppadding(context), 4.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "University",
                  familytype: 6,
                  textsize: 26.sp,
                  textcolor: getColorFromHex(ColorConstants.black),
                  marginvalue: EdgeInsets.only(top: 0.94.h),
                  textalign: TextAlign.left,
                ),
                Container(
                  margin: EdgeInsets.only(top: 2.37.h, bottom: 1.42.h),
                  width: 100.w,
                  height: 23.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          sliderImage[index],
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: sliderImage.length,
                      loop: false,
                      onIndexChanged: (value) {
                        currentPage.value = value;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ValueListenableBuilder<int>(
                      valueListenable: currentPage,
                      builder: (context, value, child) {
                        return DotsIndicator(
                          dotsCount: sliderImage.length,
                          position: value.toDouble(),
                          decorator: DotsDecorator(
                            size: Size.square(13.sp),
                            activeSize: Size(27.sp, 13.sp),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.sp,
                              ),
                            ),
                            activeColor: Colors.green,
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(5.12.w, 5.46.h, 5.76.w, 1.84.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LibraryScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 19.48.w,
                              height: 19.48.w,
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.titleBackgroundColors),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Lottie.asset("assets/icons/Library.json"),
                            ),
                            CustomText(
                              textalign: TextAlign.center,
                              text: "Library",
                              familytype: 1,
                              textsize: 15.sp,
                              marginvalue: EdgeInsets.only(top: 0.7.h),
                              textcolor: getColorFromHex(ColorConstants.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.fromLTRB(5.76.w, 5.46.h, 5.76.w, 1.84.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CourseScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              // padding:  EdgeInsets.fromLTRB(3.w,1.84.h,3.w,1.84.h),
                              width: 19.48.w,
                              height: 19.48.w,
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.titleBackgroundColors),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Lottie.asset("assets/icons/Course.json"),
                            ),
                            CustomText(
                              textalign: TextAlign.center,
                              text: "Course",
                              familytype: 1,
                              textsize: 15.sp,
                              marginvalue: EdgeInsets.only(top: 0.7.h),
                              textcolor: getColorFromHex(ColorConstants.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(5.76.w, 5.46.h, 5.12.w, 1.84.h),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              // padding:  EdgeInsets.fromLTRB(3.w,1.84.h,3.w,1.84.h),
                              width: 19.48.w,
                              height: 19.48.w,
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.titleBackgroundColors),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child:
                                  Lottie.asset("assets/icons/E-learning.json"),
                            ),
                            CustomText(
                              textalign: TextAlign.center,
                              text: "E-Learning",
                              familytype: 1,
                              textsize: 15.sp,
                              marginvalue: EdgeInsets.only(top: 0.7.h),
                              textcolor: getColorFromHex(ColorConstants.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.68.h),
                  height: 23.7.h,
                  width: 100.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.sp),
                    child: CommonVideoWidget(url),
                  ),
                ),
                SizedBox(
                  height: getH(100),
                )
              ],
            ),
          )),
    );
  }
}
