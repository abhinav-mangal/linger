import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class slotbox extends StatelessWidget with baseclass {
  slotbox(this.Challengename, this.onTap, this.iconname, this.challengetiming,
      this.status);
  final String Challengename;
  final String challengetiming;
  final String iconname;
  final bool status;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 11.h,
        width: double.maxFinite,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.sp)),
          child: Row(
            children: [
              Container(
                height: 6.16.h,
                width: 6.16.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: const Color(0xffF0F0F0),
                ),
                margin: EdgeInsets.only(left: 2.w),
                child: Padding(
                  padding: EdgeInsets.all(1.7.w),
                  child: Image.asset(
                    'assets/images/bulb.png',
                    height: 3.55.h,
                    width: 3.55.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: Challengename,
                      familytype: 1,
                      marginvalue: EdgeInsets.only(left: 4.w, top: 0),
                      textsize: 15.sp,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textalign: TextAlign.start),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 4.w, top: 0.9.h),
                        child: Image.asset(
                          'assets/images/$iconname.png',
                          height: 1.54.h,
                          width: 1.54.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      CustomText(
                          text: challengetiming,
                          familytype: 1,
                          marginvalue:
                              EdgeInsets.only(left: 0.76.w, top: 0.9.h),
                          textsize: 13.sp,
                          textcolor: getColorFromHex(ColorConstants.black),
                          textalign: TextAlign.start),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0.94.h, right: 1.8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.sp),
                      color: Colors.green,
                    ),
                    width: 13.w,
                    height: 2.36.h,
                    child: Center(
                      child: CustomText(
                          text: status ? "Active" : "Inactive",
                          familytype: 2,
                          // marginvalue: const EdgeInsets.only(right:10,),
                          textsize: 10.sp,
                          textcolor: getColorFromHex(ColorConstants.white),
                          textalign: TextAlign.center),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
