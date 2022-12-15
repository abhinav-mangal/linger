import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/CommonUtils.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';

class ProductTitleView extends StatelessWidget {
  const ProductTitleView(
      {Key? key,
      required this.title,
      this.padding,
      this.ontap,
      this.style,
      this.fontSize,
      this.iconSize,
      this.fontWeight,
      this.color,
      this.arrowText,
      this.arrowTxtWeight})
      : super(key: key);
  final String title;
  final EdgeInsets? padding;
  final Function()? ontap;
  final TextStyle? style;
  final double? fontSize;
  final double? iconSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? arrowText;
  final FontWeight? arrowTxtWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.white,
      padding: padding ??
          EdgeInsets.only(left: 4.w, right: 2.w, top: 1.h, bottom: 1.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        title: CustomText(
          text: title,
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          // marginvalue: const EdgeInsets.only(left: 16.0),
          textsize: fontSize ?? 20.sp,
          align: Alignment.centerLeft,
          fontWeight: fontWeight,
        ),
        trailing: GestureDetector(
          onTap: ontap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: arrowText ?? 'See all',
                familytype: 2,
                linecount: 1,
                textcolor:
                    CommonUtils.getColorFromHex(ColorConstants.greencolor),
                // marginvalue: const EdgeInsets.only(left: 16.0),
                textsize: fontSize ?? 20.sp - 3.sp,
                align: Alignment.centerLeft,
                fontWeight: arrowTxtWeight,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: iconSize ?? 17.sp,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
