import 'package:flutter/material.dart';
import 'package:linger/ui/quize/quizscreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../Utils/displayimage.dart';

class LeaderBoard extends StatelessWidget with baseclass {
  LeaderBoard(this.title, this.userpointdetail);
  final String title;
  final List<UserPoints> userpointdetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      margin: EdgeInsets.only(top: 3.55.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: getColorFromHex(ColorConstants.greyBackgroundScreen),
            blurRadius: 18.0,
            offset: const Offset(0, -5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27.sp), topRight: Radius.circular(27.sp)),
        color: Colors.white.withOpacity(0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 1.h),
            width: 20.8.w,
            height: 0.6.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(112.sp),
              color: const Color(0xffD9D9D9),
            ),
          ),
          SizedBox(
            width: getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 15,
                      child: CustomText(
                          text: title,
                          familytype: 6,
                          marginvalue: EdgeInsets.only(
                              left: 0, top: 1.4.h, bottom: 1.9.h),
                          textsize: 20.sp,
                          textcolor:
                              getColorFromHex(ColorConstants.darkgreencolor),
                          textalign: TextAlign.start),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Colors.green,
                        ),
                        width: 28.46.w,
                        height: 4.14.h,
                        child: Center(
                          child: CustomText(
                              text: "Day",
                              familytype: 1,
                              // marginvalue: const EdgeInsets.only(right:10,),
                              textsize: 14.sp,
                              textcolor: getColorFromHex(ColorConstants.white),
                              textalign: TextAlign.center),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: getColorFromHex(ColorConstants.lightgreycolor),
                        ),
                        width: 28.46.w,
                        height: 4.14.h,
                        child: Center(
                          child: CustomText(
                              text: "Week",
                              familytype: 1,
                              // marginvalue: const EdgeInsets.only(right:10,),
                              textsize: 14.sp,
                              textcolor: getColorFromHex(ColorConstants.black),
                              textalign: TextAlign.center),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: getColorFromHex(ColorConstants.lightgreycolor),
                        ),
                        width: 28.46.w,
                        height: 4.14.h,
                        child: Center(
                          child: CustomText(
                              text: "Season",
                              familytype: 1,
                              // marginvalue: const EdgeInsets.only(right:10,),
                              textsize: 14.sp,
                              textcolor: getColorFromHex(ColorConstants.black),
                              textalign: TextAlign.center),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          // color: Colors.black,
                          child: Column(
                            children: [
                              SizedBox(height: 12.h),
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
                              CustomText(
                                textalign: TextAlign.center,
                                text: userpointdetail[1].username,
                                familytype: 1,
                                textsize: 13.sp,
                                marginvalue: EdgeInsets.only(top: 0.8.h),
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                              ),
                              CustomText(
                                textalign: TextAlign.center,
                                text: "${userpointdetail[1].points} pt",
                                familytype: 6,
                                textsize: 13.sp,
                                marginvalue: EdgeInsets.only(top: 0.47.h),
                                textcolor:
                                    getColorFromHex(ColorConstants.greencolor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          // color: Colors.black,
                          child: Column(
                            children: [
                              SizedBox(height: 3.h),
                              SizedBox(
                                height: 16.21.h,
                                width: 16.21.h,
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
                              CustomText(
                                textalign: TextAlign.center,
                                text: userpointdetail[0].username,
                                familytype: 2,
                                textsize: 15.sp,
                                marginvalue: EdgeInsets.only(top: 1.18.h),
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                              ),
                              CustomText(
                                textalign: TextAlign.center,
                                text: "${userpointdetail[0].points} pt",
                                familytype: 6,
                                textsize: 15.sp,
                                marginvalue: EdgeInsets.only(top: 0.47.h),
                                textcolor:
                                    getColorFromHex(ColorConstants.greencolor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          // color: Colors.black,
                          child: Column(
                            children: [
                              SizedBox(height: 12.h),
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
                              CustomText(
                                textalign: TextAlign.center,
                                text: userpointdetail[2].username,
                                familytype: 1,
                                textsize: 13.sp,
                                marginvalue: EdgeInsets.only(top: 0.8.h),
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                              ),
                              CustomText(
                                textalign: TextAlign.center,
                                text: "${userpointdetail[2].points} pt",
                                familytype: 6,
                                textsize: 13.sp,
                                marginvalue: EdgeInsets.only(top: 0.47.h),
                                textcolor:
                                    getColorFromHex(ColorConstants.greencolor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 10);
                            },
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: userpointdetail != []
                                ? userpointdetail.length - 3
                                : 0,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 9.47.h,
                                // margin: const EdgeInsets.only(top:20,bottom:40,),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "${index + 4}",
                                      familytype: 1,
                                      linecount: 1,
                                      marginvalue: EdgeInsets.only(left: 7.17.w),
                                      textcolor:
                                          getColorFromHex(ColorConstants.greycolor)
                                              .withOpacity(0.6),
                                      textsize: 15.sp,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4.87.w),
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
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(62.sp),
                                        color: Colors.green,
                                      ),
                                      margin: EdgeInsets.only(right: 4.w),
                                      width: 5.68.h,
                                      height: 2.84.h,
                                      child: Center(
                                        child: CustomText(
                                            // marginvalue: const EdgeInsets.all(8.0),
                                            text:
                                                "${userpointdetail[index + 3].points} Pt",
                                            familytype: 1,
                                            // marginvalue: const EdgeInsets.only(right:10,),
                                            textsize: 13.sp,
                                            textcolor: getColorFromHex(
                                                ColorConstants.white),
                                            textalign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
