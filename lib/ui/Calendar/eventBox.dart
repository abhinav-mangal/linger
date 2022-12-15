import 'package:flutter/material.dart';
import 'package:linger/Utils/AssetImage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class eventBox extends StatelessWidget with baseclass {
  const eventBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getW(20), right: getW(20), top: getH(10), bottom: getH(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(34.sp)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 12,
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: getH(46),
            height: getH(46),
            margin: EdgeInsets.all(getH(11)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: getColorFromHex(ColorConstants.systembluecolor))),
            child: Center(
              child: MyAssetImage(
                  height: getH(38),
                  width: getH(38),
                  icontint: '',
                  // marginvalue: const EdgeInsets.only(bottom: 4),
                  imageName: "plane-alt.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                textalign: TextAlign.center,
                text: "Lucknow (LKO) - Delhi (DEL)",
                familytype: 1,
                textsize: 14.sp,
                textcolor: getColorFromHex(ColorConstants.black),
              ),
              CustomText(
                marginvalue: EdgeInsets.only(top: getH(5)),
                textalign: TextAlign.center,
                text: "11:30 AM - 12.30 PM",
                familytype: 2,
                textsize: 10.sp,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
              ),
            ],
          )
        ],
      ),
    );
  }
}
