import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Utils/CommonUtils.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/widgets/animation_view.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Basepackage/baseclass.dart';
import '../Utils/customText.dart';
import '../cubits/home_cubit/home_cubit.dart';

class AllPrayerScreen extends StatefulWidget {
  const AllPrayerScreen({Key? key}) : super(key: key);

  @override
  State<AllPrayerScreen> createState() => _AllPrayerScreenState();
}

class _AllPrayerScreenState extends State<AllPrayerScreen> with baseclass {
  HomeCubit? homeCubit;
  final String faizr = 'assets/images/faizr.png';
  final String sunrise = 'assets/images/sunrise.png';
  final String duphr = 'assets/images/duphr.png';
  final String asr = 'assets/images/asr.png';
  final String mghrib = 'assets/images/mghrib.png';
  final String isha = 'assets/images/isha.png';
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  bool button5 = false;
  bool button6 = false;
  onClick(String value) {}
  @override
  void initState() {
    // TODO: implement initState
    homeCubit = context.read<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: size.width,
                  height: 47.h,
                  child: Stack(
                    children: [
                      state.currentArtBoard == null
                          ? Center(
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.all(5),
                                  child: const CircularProgressIndicator(
                                      strokeWidth: 2.0)),
                            )
                          : LayoutBuilder(
                              builder: (_, BoxConstraints constraints) {
                                return AnimationView(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight,
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                textalign: TextAlign.center,
                                text: "Next Prayer",
                                familytype: 1,
                                textsize: 20.sp,
                                textcolor: state.colorStatus!.withOpacity(0.6),
                              ),
                              CustomText(
                                textalign: TextAlign.center,
                                text:
                                    "${state.prayername == null ? '' : state.prayername!.split(' ')[0]} ${(state.counter == null ? '' : state.counter.toString().split('.')[0])}",
                                familytype: 6,
                                textsize: 26.sp,
                                textcolor: state.colorStatus!,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Chip(
                                label: Text(
                                  "${state.city ?? ''} ${state.weather ?? ''}",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Card(
                          margin: EdgeInsets.only(left: 4.w, right: 4.w),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 20),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          button1 = !button1;
                                        });
                                      },
                                      child: button1
                                          ? Icon(
                                              Icons.notifications_on,
                                              size: 20.sp,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          : Icon(
                                              Icons.notifications_off,
                                              size: 20.sp,
                                            ),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      radius: 26,
                                      child: Padding(
                                        padding: EdgeInsets.all(getH(8)),
                                        child: Lottie.asset(
                                            "assets/icons/fazar.json"),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: "Fajr",
                                          familytype: 1,
                                          textsize: 16.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: state.timing?.timings?.fajr! ??
                                              '',
                                          familytype: 1,
                                          textsize: 15.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          button2 = !button2;
                                        });
                                      },
                                      child: button2
                                          ? Icon(
                                              Icons.notifications_on,
                                              size: 20.sp,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          : Icon(
                                              Icons.notifications_off,
                                              size: 20.sp,
                                            ),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      radius: 26,
                                      child: Padding(
                                        padding: EdgeInsets.all(getH(8)),
                                        child: Lottie.asset(
                                            "assets/icons/sunrise.json"),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: "Sunrise",
                                          familytype: 1,
                                          textsize: 16.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text:
                                              state.timing?.timings?.sunrise! ??
                                                  '',
                                          familytype: 1,
                                          textsize: 15.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      radius: 26,
                                      child: Padding(
                                        padding: EdgeInsets.all(getH(8)),
                                        child: Lottie.asset(
                                            "assets/icons/zuhar.json"),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: "Dhuhr",
                                          familytype: 1,
                                          textsize: 16.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: state.timing?.timings?.dhuhr ??
                                              '',
                                          familytype: 1,
                                          textsize: 15.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          button3 = !button3;
                                        });
                                      },
                                      child: button3
                                          ? Icon(
                                              Icons.notifications_on,
                                              size: 20.sp,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          : Icon(
                                              Icons.notifications_off,
                                              size: 20.sp,
                                            ),
                                    ),
                                  ),
                                ),
                                spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      radius: 26,
                                      child: Padding(
                                        padding: EdgeInsets.all(getH(8)),
                                        child: Lottie.asset(
                                            "assets/icons/asr.json"),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: "Asr",
                                          familytype: 1,
                                          textsize: 16.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text:
                                              state.timing?.timings?.asr ?? '',
                                          familytype: 1,
                                          textsize: 15.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          button4 = !button4;
                                        });
                                      },
                                      child: button4
                                          ? Icon(
                                              Icons.notifications_on,
                                              size: 20.sp,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          : Icon(
                                              Icons.notifications_off,
                                              size: 20.sp,
                                            ),
                                    ),
                                  ),
                                ),
                                spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      radius: 26,
                                      child: Padding(
                                        padding: EdgeInsets.all(getH(8)),
                                        child: Lottie.asset(
                                            "assets/icons/sunrise.json"),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: "Maghrib",
                                          familytype: 1,
                                          textsize: 16.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text:
                                              state.timing?.timings?.maghrib ??
                                                  '',
                                          familytype: 1,
                                          textsize: 15.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          button5 = !button5;
                                        });
                                      },
                                      child: button5
                                          ? Icon(
                                              Icons.notifications_on,
                                              size: 20.sp,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          : Icon(
                                              Icons.notifications_off,
                                              size: 20.sp,
                                            ),
                                    ),
                                  ),
                                ),
                                spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          button6 = !button6;
                                        });
                                      },
                                      child: button6
                                          ? Icon(
                                              Icons.notifications_on,
                                              size: 20.sp,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          : Icon(
                                              Icons.notifications_off,
                                              size: 20.sp,
                                            ),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: getColorFromHex(
                                          ColorConstants.greyBackgroundScreen),
                                      radius: 26,
                                      child: Padding(
                                        padding: EdgeInsets.all(getH(8)),
                                        child: Lottie.asset(
                                            "assets/icons/isha.json"),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text: "Isha",
                                          familytype: 1,
                                          textsize: 16.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.center,
                                          text:
                                              state.timing?.timings?.isha ?? '',
                                          familytype: 1,
                                          textsize: 15.sp,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 2.h, top: 2.h, left: 6.48.w, right: 6.48.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 23.w,
                              // height:14.91.h ,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 4.7.h,
                                    backgroundColor:
                                        CommonUtils.getColorFromHex(
                                            ColorConstants.whitishgrey),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.sp),
                                      child: Center(
                                        child: Lottie.asset(
                                            "assets/icons/Qibla.json"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.18.h,
                                  ),
                                  Text(
                                    'Qibla direction',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 23.w,
                              // height:14.91.h,
                              padding: EdgeInsets.zero,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                      radius: 4.7.h,
                                      backgroundColor:
                                          CommonUtils.getColorFromHex(
                                              ColorConstants.whitishgrey),
                                      child: Padding(
                                          padding: EdgeInsets.all(15.sp),
                                          child: Lottie.asset(
                                              "assets/icons/Tasbeeh.json"))),
                                  SizedBox(
                                    height: 1.18.h,
                                  ),
                                  Text(
                                    'Tasbeeh',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 23.w,
                              // height:14.91.h ,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 4.7.h,
                                    backgroundColor:
                                        CommonUtils.getColorFromHex(
                                            ColorConstants.whitishgrey),
                                    child: Padding(
                                        padding: EdgeInsets.all(15.sp),
                                        child: Lottie.asset(
                                            "assets/icons/Qayam.json")),
                                  ),
                                  SizedBox(
                                    height: 1.18.h,
                                  ),
                                  Text(
                                    'Qayam reminder',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget spacer() {
    return Container(
      margin: const EdgeInsets.only(left: 42),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(
              '|',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(
                    60,
                    60,
                    67,
                    0.6,
                  ),
                  fontSize: 7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(
              '|',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(
                  60,
                  60,
                  67,
                  0.6,
                ),
                fontSize: 7,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(
              '|',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(
                    60,
                    60,
                    67,
                    0.6,
                  ),
                  fontSize: 7),
            ),
          ),
        ],
      ),
    );
  }
}
