import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class CalendarButton extends StatelessWidget with baseclass {
  CalendarButton(
      {Key? key,
      this.buttoncolor,
      this.buttontext,
      this.outerbordercolor,
      this.textcolor,
      this.buttontitle})
      : super(key: key);
  final String? buttontext;
  final Color? outerbordercolor;
  final Color? buttoncolor;
  final Color? textcolor;
  final String? buttontitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: getW(12), right: getW(12), top: getH(10), bottom: getH(11)),
          padding: EdgeInsets.all(getW(5.5)),
          decoration: BoxDecoration(
              // color: getColorFromHex(ColorConstants.white),
              shape: BoxShape.circle,
              border: Border.all(color: outerbordercolor!, width: getW(2.0))),
          child: Container(
            width: getH(52),
            height: getH(52),
            // margin: EdgeInsets.all(getH(11)),
            decoration: BoxDecoration(
                color: buttoncolor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color:
                        getColorFromHex(ColorConstants.black).withOpacity(0.25),
                    offset: Offset(0, 0),
                    blurRadius: 15.3,
                    spreadRadius: 0,
                  )
                ]),
            child: Center(
              child: CustomText(
                text: buttontext!,
                familytype: 2,
                textsize: 12.sp,
                textcolor: textcolor!,
                textalign: TextAlign.left,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: getH(30)),
          width: getW(88),
          child: CustomText(
            text: buttontitle!,
            familytype: 2,
            textsize: 12.sp,
            textcolor: getColorFromHex(ColorConstants.black),
            textalign: TextAlign.left,
            linecount: 2,
            align: Alignment.center,
          ),
        ),
      ],
    );
  }
}
