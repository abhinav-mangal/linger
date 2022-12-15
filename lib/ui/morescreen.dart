import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/customText.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with baseclass {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textalign: TextAlign.center,
                  text: "More",
                  familytype: 6,
                  textsize: 24.sp,
                  marginvalue:
                      EdgeInsets.only(left: 4.w, top: gettoppadding(context)),
                  textcolor: getColorFromHex(ColorConstants.black),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(4.w, 2.84.h, 4.w, 0),
                    // padding:  EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.sp),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Moredetails(
                            'islam1.png',
                            "What is Islam",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'Article360.png',
                            "Article 360",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'dua.png',
                            "Dua & Wazifa",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'Islamicfestival.png',
                            "Islamic Festivals",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'onlinezikr.png',
                            "Online Zikr",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'ruhaniilaj.png',
                            "Ruhani Ilaaj",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'Edarulifta.png',
                            "E Darul Ifta",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'Babyname.png',
                            "Baby Names",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'Onlinekhadim.png',
                            "Online Khadim",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'masqSurvey.png',
                            "Masq Survey",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                        Moredetails(
                            'khwabkitabeer.png',
                            "Khwab ki Tabeer",
                            () {},
                            Icon(
                              Icons.arrow_forward_ios,
                              color: getColorFromHex(ColorConstants.green),
                              size: 18.sp,
                            ),
                            true),
                      ],
                    )),
              ]),
        ));
  }
}

class Moredetails extends StatelessWidget with baseclass {
  Moredetails(this.moreimage, this.morename, this.morefunction,
      this.trailingwidget, this.arrowshow);
  final Widget trailingwidget;
  final String moreimage;
  final String morename;
  final Function() morefunction;
  final bool arrowshow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.9.h,
      child: Center(
        child: InkWell(
          onTap: morefunction,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  "assets/images/$moreimage",
                  // height: 5.64.w,
                  // width: 5.64.w,
                  height: 3.5.h,
                  width: 3.5.h,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  morename,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ]),
              const Spacer(),
              Visibility(visible: arrowshow, child: trailingwidget),
              SizedBox(
                width: 4.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
