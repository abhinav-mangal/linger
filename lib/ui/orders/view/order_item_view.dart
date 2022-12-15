import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderItemView extends StatelessWidget with baseclass {
  OrderItemView(this.Imageurl, this.Itemname, this.Itemcategory, this.ItemPrice, this.ItemQuantity, {Key? key})
      : super(key: key);
  final String? Imageurl;
  final String? Itemname;
  final String? Itemcategory;
  final String? ItemPrice;
  final String? ItemQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 9.5.h,
              width: 20.w,
              decoration: BoxDecoration(
                border: Border.all(color: getColorFromHex(ColorConstants.bordercolor)),
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              ),
              margin: EdgeInsets.only(right: 2.w),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                child: CachedNetworkImage(
                  imageUrl: Imageurl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: Itemname ?? '',
                  familytype: 1,
                  linecount: 1,
                  textcolor: getColorFromHex(ColorConstants.black),
                  textsize: 17.sp,
                  align: Alignment.topLeft,
                ),
                CustomText(
                  text: Itemcategory ?? '',
                  familytype: 1,
                  linecount: 1,
                  textcolor: getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                  textsize: 13.sp,
                  align: Alignment.centerLeft,
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    CustomText(
                      text: "$ItemPrice.00 ₹" ?? '',
                      familytype: 1,
                      linecount: 1,
                      textcolor: getColorFromHex(ColorConstants.greencolor),
                      textsize: 17.sp,
                      align: Alignment.centerLeft,
                    ),
                    const Spacer(),
                    CustomText(
                      text:"x${ItemQuantity}" ?? '',
                      familytype: 1,
                      linecount: 1,
                      textcolor: getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                      textsize: 15.sp,
                      align: Alignment.centerRight,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
    );
  }
}
