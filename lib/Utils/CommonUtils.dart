import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final GlobalKey<State> _progressloader = GlobalKey<State>();

class CommonUtils {
  static String assetsPath = 'assets/images/';

  static String assetsImage(String fileName) {
    switch (fileName) {
      case 'Filter':
        return '${assetsPath}ic_filter_default.png';
    }

    return '';
  }

  static String validateCVV(String value) {
    if (value.isEmpty) {
      return "CVV/CVC is Required";
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return "";
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Color(int.parse("0xff000000"));
  }

  static Future<DateTime?> PickDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );
    return d;
  }

  static bool isHavingvalue(String str) {
    if (str == null) {
      return false;
    } else {
      if (str.isNotEmpty) {
        if (str == "null") {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    }
  }

  static showCustombottomsheetdialog(BuildContext context, Widget scrollableui,
      Widget titleui, double height, Color clor) {
    showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        // enableDrag: true,
        isScrollControlled: true,
        // backgroundColor: Colors.white.withOpacity(0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: height,
            child: Container(
              decoration: BoxDecoration(
                color: clor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp)),
              ),
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.6.h, bottom: 2.h),
                  child: scrollableui,
                ),
                titleui,
              ]),
            ),
          );
        });
  }
}
