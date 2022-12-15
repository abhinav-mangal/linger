import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/CommonUtils.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class ArrowText extends StatelessWidget {
  const ArrowText(
      {Key? key,
      required this.onTap,
      this.fontSize,
      this.arrowText,
      this.arrowTxtWeight,
      this.iconSize})
      : super(key: key);
  final VoidCallback onTap;
  final double? fontSize;
  final String? arrowText;
  final FontWeight? arrowTxtWeight;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: arrowText ?? 'See all',
            familytype: 2,
            linecount: 1,
            textcolor: CommonUtils.getColorFromHex(ColorConstants.greencolor),
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
    );
  }
}
