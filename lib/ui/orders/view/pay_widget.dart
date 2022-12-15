import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Basepackage/baseclass.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';
import '../../../Utils/roundbutton.dart';

class PayWidget extends StatelessWidget with baseclass {
  PayWidget(this.etext, this.tex, this.ontapt, this.ontape, {Key? key}) : super(key: key);
  final String etext;
  final String tex;
  final Function() ontapt;
  final Function() ontape;

  @override
  Widget build(BuildContext context) {
    return etext != ""
        ? Row(
            children: [
              const Spacer(),
              Visibility(
                visible: tex != "",
                child: Container(
                  margin: EdgeInsets.only(
                    top: 1.h,
                  ),
                  child: RoundButton(
                    onItemtabed: ontapt,
                    width: 30.w,
                    height: 4.26.h,
                    roundradius: 12.sp,
                    blurRadius: 0,
                    opaacity: 1,
                    boxShadowcolor: ColorConstants.greencolor,
                    startcolor: ColorConstants.white,
                    endcolor: ColorConstants.white,
                    textchild: CustomText(
                      text: tex,
                      familytype: 2,
                      textsize: 14.sp,
                      textcolor: getColorFromHex(ColorConstants.greencolor),
                      textalign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: tex != "",
                  child: SizedBox(
                    width: 2.w,
                  )),
              Container(
                margin: EdgeInsets.only(
                  top: 1.h,
                ),
                child: RoundButton(
                  onItemtabed: ontape,
                  width: 30.w,
                  height: 4.26.h,
                  roundradius: 12.sp,
                  blurRadius: 0,
                  opaacity: 1,
                  boxShadowcolor: ColorConstants.greencolor,
                  startcolor: ColorConstants.greencolor,
                  endcolor: ColorConstants.greencolor,
                  textchild: CustomText(
                    text: etext,
                    familytype: 2,
                    textsize: 14.sp,
                    textcolor: getColorFromHex(ColorConstants.white),
                    textalign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
            ],
          )
        : Container();
  }
}
