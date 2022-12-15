import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

typedef callback = void Function();
typedef FutureVoidCallback = Future<void> Function();
typedef clickfuncution = void Function(String values);
typedef callbackvalidator = Function(String values);
typedef Successcallback = void Function(Object json, int requestcode);
typedef Errorresponsecallback = void Function(String msg, int requestcode);
typedef jsontomodelconvertion = Object Function(String);
typedef retrunstringfunction = String Function(String);
typedef onSelectionCallBack = void Function(dynamic);
typedef refreshCallBack = void Function(int, dynamic);

mixin baseclass {
  static List<String> _image_types = [
    'jpg',
    'jpeg',
    'jfif',
    'pjpeg',
    'pjp',
    'png',
    'svg',
    'gif',
    'apng',
    'webp',
    'avif'
  ];

  static List<String> _video_types = [
    "3g2",
    "3gp",
    "aaf",
    "asf",
    "avchd",
    "avi",
    "drc",
    "flv",
    "m2v",
    "m3u8",
    "m4p",
    "m4v",
    "mkv",
    "mng",
    "mov",
    "mp2",
    "mp4",
    "mpe",
    "mpeg",
    "mpg",
    "mpv",
    "mxf",
    "nsv",
    "ogg",
    "ogv",
    "qt",
    "rm",
    "rmvb",
    "roq",
    "svi",
    "vob",
    "webm",
    "wmv",
    "yuv"
  ];

  bool isImages(String extension) {
    extension = extension.split('.').last;
    if (_image_types.contains(extension)) {
      return true;
    } else if (_video_types.contains(extension)) {
      return false;
    }
    return true;
  }


  // String getOrderStatus(String ){
  //   return
  // }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Color(int.parse("0xff000000"));
  }

  String formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final minutes = duration.inMinutes;
    final seconds = totalSeconds % 60;

    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '$minutesString min $secondsString sec';
  }

  bool isHavingvalue(String str) {
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

  int convertToInt(String convertionvalue) {
    try {
      if (isHavingvalue(convertionvalue)) {
        return int.parse(convertionvalue);
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  String allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double gettoppadding(BuildContext context) {
    return MediaQueryData.fromWindow(window).padding.top;
  }

  double getbottompadding(BuildContext context) {
    return MediaQueryData.fromWindow(window).padding.bottom;
  }

  double getW(double width) {
    double wid = (width * 100) / 390;
    return wid.w;
  }

  double getH(double height) {
    double hei = (height * 100) / 844;
    return hei.h;
  }

  int getdiscountprice(double listprice, double saleprice) {
    int discount = (((listprice - saleprice) / listprice) * 100).ceil();
    return discount;
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  String convertdatetime(String data) {
    String halfdate = "";
    DateTime date = DateTime.parse(data.split("T")[0]);
    halfdate = DateFormat('MMM dd').format(date);

    return halfdate;
  }

  double convertToDouble(String convertionvalue) {
    try {
      if (isHavingvalue(convertionvalue)) {
        return double.parse(convertionvalue);
      } else {
        return 0.0;
      }
    } catch (e) {
      print(e);
      return 0.0;
    }
  }
}
