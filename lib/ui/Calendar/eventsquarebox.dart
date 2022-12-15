import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class eventSquareBox extends StatelessWidget with baseclass {
  const eventSquareBox({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color ch = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      decoration: BoxDecoration(
          color: color!.withOpacity(0.6),
          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 12,
            ),
          ]),
      child: Column(
        children: [
          CustomText(
            marginvalue: EdgeInsets.only(top: getH(12), bottom: getH(12)),
            textalign: TextAlign.center,
            text: "Phagun",
            familytype: 2,
            textsize: 14.sp,
            textcolor: color!.withOpacity(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                marginvalue: EdgeInsets.only(
                    top: getH(6), bottom: getH(6), right: getW(12)),
                textalign: TextAlign.center,
                text: "Fasli",
                familytype: 1,
                textsize: 14.sp,
                textcolor: getColorFromHex(ColorConstants.black),
              ),
              Container(
                height: getH(27),
                width: getW(1),
                color: Colors.black.withOpacity(0.3),
              ),
              CustomText(
                marginvalue: EdgeInsets.only(
                    top: getH(6), bottom: getH(6), left: getW(12)),
                textalign: TextAlign.center,
                text: "1429",
                familytype: 1,
                textsize: 14.sp,
                textcolor: getColorFromHex(ColorConstants.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
