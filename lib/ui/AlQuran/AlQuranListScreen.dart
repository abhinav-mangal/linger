import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/data/model/al_quran/surah_model.dart';
import 'package:linger/data/model/theme_modal.dart';
import 'package:linger/data/model/user_quran_response_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlQuranListScreen extends StatelessWidget with baseclass {
  // final Chapters chapters;
  final Surah? surah;
  final Juz? juz;
  final ThemeModal themeData;
  const AlQuranListScreen(
      {Key? key, this.surah, this.juz, required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(1.4.w, 1.h, 1.4.w, 1.h),
      margin: EdgeInsets.fromLTRB(4.w, 0.8.h, 4.w, 0.8.h),
      // decoration: BoxDecoration(
      color: themeData.cardsColors,
      //   borderRadius: BorderRadius.all(Radius.circular(12.sp)),
      //   boxShadow: [
      //     BoxShadow(
      //       color:
      //           getColorFromHex(ColorConstants.shadowcolor).withOpacity(0.06),
      //       spreadRadius: 0,
      //       blurRadius: 12,
      //       offset: const Offset(0, 2), // changes position of shadow
      //     )
      //   ],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: surah == null
                ? juz!.number.toString()
                : surah!.number.toString(),
            familytype: 2,
            linecount: 1,
            textcolor: themeData.arrowIconColor,
            // marginvalue:  EdgeInsets.only(left: 4.w),
            textsize: 18.sp,
            align: Alignment.centerLeft,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: surah == null ? juz!.englishName! : surah!.englishName!,
                  familytype: 2,
                  // linecount: 1,
                  textcolor: themeData.textColor,
                  // marginvalue:  EdgeInsets.only(left: 4.w),
                  textsize: 19.sp,
                  align: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                CustomText(
                  text: '',
                  familytype: 2,
                  // linecount: 1,
                  textcolor: Colors.grey,
                  // marginvalue:  EdgeInsets.only(left: 4.w),
                  textsize: 17.sp,
                  align: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
            child: Icon(
              Icons.arrow_forward_ios,
              color: themeData.arrowIconColor,
              size: 3.h,
            ),
          )
        ],
      ),
    );
  }
}
