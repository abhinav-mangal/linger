import 'package:flutter/material.dart';
import 'package:linger/ui/shope/views/product_attribute_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Basepackage/baseclass.dart';
import '../../../Utils/CommonUtils.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';

class SelectAllView extends StatelessWidget with baseclass {
  const SelectAllView(
      {Key? key, required this.title, this.padding, required this.onTap})
      : super(key: key);
  final String title;
  final double? padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 4.w, right: 2.w, top: 1.h, bottom: 1.h),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        title: CustomText(
          text: 'Select options',
          familytype: 7,
          linecount: 1,
          textcolor: CommonUtils.getColorFromHex(ColorConstants.greencolor),
          textsize: 15.sp,
          align: Alignment.centerLeft,
          fontWeight: FontWeight.w400,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 17.sp,
                color: CommonUtils.getColorFromHex(ColorConstants.greencolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
