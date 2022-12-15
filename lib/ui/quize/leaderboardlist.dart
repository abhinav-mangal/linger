import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;
import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../Utils/displayimage.dart';
import 'leaderboardscreen.dart';

class leaderboardlist extends StatelessWidget with baseclass {
  final int number;
  final List<UserPoints> userpointdetail;
  const leaderboardlist(
      {Key? key, required this.number, required this.userpointdetail});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20, top: getH(26)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Stack(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 11.5.h,
                            width: 11.5.h,
                            child: Center(
                              child: DisplayImage(
                                  circleheight: 9.5.h,
                                  circlewidth: 9.5.h,
                                  imagePath: userpointdetail[2].imageurl,
                                  onPressed: () {},
                                  colr: const Color(0xff929292),
                                  number: "2"),
                            ),
                          ),
                          Positioned(
                            top: -3.5.h,
                            left: 0.w,
                            child: Transform.rotate(
                              angle: -30 * math.pi / 180,
                              child: CustomText(
                                text: "2",
                                familytype: 8,
                                linecount: 1,
                                // marginvalue: EdgeInsets.only(right:getW(14)),
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                                textsize: 28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        textalign: TextAlign.center,
                        text: userpointdetail[1].username,
                        familytype: 1,
                        textsize: 14.sp,
                        marginvalue: EdgeInsets.only(top: 0.8.h),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                      CustomText(
                        textalign: TextAlign.center,
                        text: "${userpointdetail[1].points} ",
                        familytype: 3,
                        textsize: 13.sp,
                        marginvalue: EdgeInsets.only(top: 0.47.h),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.black,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: getH(114),
                            width: getH(114),
                            // margin: EdgeInsets.only(top: 3.h),
                            child: Center(
                              child: DisplayImage(
                                  circleheight: 14.21.h,
                                  circlewidth: 14.21.h,
                                  imagePath: userpointdetail[0].imageurl,
                                  onPressed: () {},
                                  colr: const Color(0xffFF9500),
                                  number: "1"),
                            ),
                          ),
                          Positioned(
                            top: -getH(35),
                            right: -1.5.w,
                            child: Transform.rotate(
                              angle: 15 * math.pi / 180,
                              child: Image.asset(
                                'assets/images/crown.png',
                                height: getH(52),
                                width: getH(52),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        textalign: TextAlign.center,
                        text: userpointdetail[0].username,
                        familytype: 2,
                        textsize: 15.sp,
                        marginvalue: EdgeInsets.only(top: 1.18.h),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                      CustomText(
                        textalign: TextAlign.center,
                        text: "${userpointdetail[0].points} ",
                        familytype: 6,
                        textsize: 15.sp,
                        marginvalue: EdgeInsets.only(top: 0.47.h),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 11.5.h,
                            width: 11.5.h,
                            child: Center(
                              child: DisplayImage(
                                  circleheight: 9.5.h,
                                  circlewidth: 9.5.h,
                                  imagePath: userpointdetail[1].imageurl,
                                  onPressed: () {},
                                  colr: const Color(0xffAE6F35),
                                  number: "3"),
                            ),
                          ),
                          Positioned(
                            top: -3.5.h,
                            right: 0.w,
                            child: Transform.rotate(
                              angle: 30 * math.pi / 180,
                              child: CustomText(
                                text: "3",
                                familytype: 8,
                                linecount: 1,
                                // marginvalue: EdgeInsets.only(right:getW(14)),
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                                textsize: 28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        textalign: TextAlign.center,
                        text: userpointdetail[2].username,
                        familytype: 1,
                        textsize: 13.sp,
                        marginvalue: EdgeInsets.only(top: 0.8.h),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                      CustomText(
                        textalign: TextAlign.center,
                        text: "${userpointdetail[2].points}",
                        familytype: 6,
                        textsize: 13.sp,
                        marginvalue: EdgeInsets.only(top: 0.47.h),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: getH(20));
              },
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: userpointdetail != [] ? userpointdetail.length - 3 : 0,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 9.47.h,
                  // margin: const EdgeInsets.only(top:20,bottom:40,),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomText(
                          text: "${index + 4}",
                          familytype: 8,
                          linecount: 1,
                          marginvalue: EdgeInsets.only(right: getW(14)),
                          textcolor: getColorFromHex(ColorConstants.black),
                          textsize: 28.sp,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(34.sp),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 0,
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(getH(12)),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.lightBlueAccent, width: 2),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  radius: 2.84.h,
                                  backgroundImage: NetworkImage(
                                    userpointdetail[index + 3].imageurl,
                                  ),
                                ),
                              ),
                              CustomText(
                                text: userpointdetail[index + 3].username,
                                familytype: 1,
                                linecount: 1,
                                marginvalue: EdgeInsets.only(left: 3.w),
                                textcolor: Colors.black,
                                textsize: 15.sp,
                              ),
                              const Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 4.w),
                                child: CustomText(
                                    text:
                                        "${userpointdetail[index + 3].points}",
                                    familytype: 6,
                                    textsize: 16.sp,
                                    textcolor:
                                        getColorFromHex(ColorConstants.black),
                                    textalign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: getH(100),
          )
        ],
      ),
    );
  }
}
