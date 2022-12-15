import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/cubits/home_cubit/home_cubit.dart';
import 'package:linger/data/model/user_home_reponse_model.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/router/route_names.dart';
import 'package:linger/ui/AlQuran/AlQuranScreen.dart';
import 'package:linger/ui/Sunnat/FeedScreen.dart';
import 'package:linger/ui/all_prayers_screen.dart';
import 'package:linger/ui/widgets/animation_view.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'Calendar/my_calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with baseclass, SingleTickerProviderStateMixin {
  DateTime dateTime = DateTime.now();
  BoxDecoration decoration = const BoxDecoration();
  Timeslot? timeslot;
  final currentPage = ValueNotifier<int>(0);
  GlobalKey previewContainer =
      GlobalKey(debugLabel: 'GlobalScaffoldKey #preview');
  //Duration counter = const Duration(hours: 00, minutes: 00, seconds: 00);

  // SMITrigger? trigger;
  // StateMachineController? stateMachineController;
  HomeCubit? homeCubit;

  DateFormat hourFormat = DateFormat.Hm();
  DateFormat dayFormat = DateFormat.EEEE();

  late DateTime sunrise;
  late DateTime sunset;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        Data? homeRes = state.home;
        return Scaffold(
          // backgroundColor: Colors.transparent,
          // extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AllPrayerScreen()));
                      },
                      child: SizedBox(
                        width: 100.w,
                        height: 47.4.h,
                        child: state.currentArtBoard == null
                            ? Center(
                                child: Container(
                                    height: 5.12.w,
                                    width: 5.12.w,
                                    margin: const EdgeInsets.all(5),
                                    child: const CircularProgressIndicator(
                                        strokeWidth: 2.0)),
                              )
                            : LayoutBuilder(
                                builder: (_, BoxConstraints constraints) {
                                  return AnimationView(
                                    // width: 100.w,
                                    // height: 47.4.h,
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  SizedBox(
                      width: 100.w,
                      height: 47.4.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(height:MediaQueryData.fromWindow(window).padding.top/3),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.fromLTRB(4.w, 6.h, 4.w, 0),
                                    alignment: Alignment.topLeft,
                                    child: Row(children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const MyCalendarScreen()));
                                        },
                                        child: Container(
                                          height: 10.46.w,
                                          width: 10.46.w,
                                          padding: EdgeInsets.all(1.92.w),
                                          margin: EdgeInsets.only(right: 4.w),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Lottie.asset(
                                                "assets/icons/calendar.json"),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat("EEEE, d MMMM")
                                                .format(dateTime),
                                            style: TextStyle(
                                                color: state.colorStatus ??
                                                    Colors.black,
                                                fontFamily: 'Medium',
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            '23 Sha’ban 1443 AH',
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus
                                                    ?.withOpacity(0.7),
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ])),
                                InkWell(
                                  onTap: () {
                                    getItInjector<AppRouter>()
                                        .pushNamed(RouteNames.drawerMenuScreen);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(right: 4.w, top: 4.h),
                                    child: Icon(
                                      Icons.menu,
                                      color: state.colorStatus,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      fontFamily: 'Reguler',
                                      color:
                                          state.colorStatus?.withOpacity(0.7),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${state.prayername == null ? '' : state.prayername!.split(' ')[0]}",
                                              style: TextStyle(
                                                  fontFamily: 'Bold',
                                                  color: state.colorStatus,
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Row(children: [
                                        Text(
                                          " ${(state.counter == null ? '' : state.counter!.toString().split(':')[0] + ':' + state.counter!.toString().split(':')[1])}",
                                          style: TextStyle(
                                              fontFamily: 'Bold',
                                              color: state.colorStatus,
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          " ${(state.counter == null ? '' : state.counter!.toString().split(':')[2].split('.')[0])}",
                                          style: TextStyle(
                                              fontFamily: 'Bold',
                                              color: state.colorStatus,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 0.7.h,
                                ),
                                // Text(
                                //   state.counter != null
                                //       ? state.counter.toString().split('.')[0]
                                //       : '',
                                //   style: TextStyle(
                                //       color: state.colorStatus,
                                //       fontSize: 20.sp,
                                //       fontWeight: FontWeight.w600),
                                // ),
                                state.city != null && state.weather != null
                                    ? Chip(
                                        backgroundColor: getColorFromHex(
                                                ColorConstants.black)
                                            .withOpacity(0.12),
                                        label: Text(
                                          "${state.city ?? ''} ${state.weather ?? ''}",
                                          style: TextStyle(
                                              color: state.colorStatus,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    : const SizedBox(),
                              ]),
                          !state.loading
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 2.36.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            state.timing?.timings?.fajr! ?? '',
                                            style: TextStyle(
                                                color: state.colorStatus,
                                                fontSize: 17.sp,
                                                fontFamily: 'Reguler',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Fajr",
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus
                                                    ?.withOpacity(0.7),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: 3.79.h,
                                          child: VerticalDivider(
                                              color: state.colorStatus
                                                  ?.withOpacity(0.36))),
                                      Column(
                                        children: [
                                          Text(
                                            state.timing?.timings?.dhuhr ?? '',
                                            style: TextStyle(
                                                color: state.colorStatus,
                                                fontSize: 17.sp,
                                                fontFamily: 'Reguler',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Dhruhr",
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus
                                                    ?.withOpacity(0.7),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: 3.79.h,
                                          child: VerticalDivider(
                                              color: state.colorStatus
                                                  ?.withOpacity(0.36))),
                                      Column(
                                        children: [
                                          Text(
                                            state.timing?.timings?.asr ?? '',
                                            style: TextStyle(
                                                color: state.colorStatus,
                                                fontSize: 17.sp,
                                                fontFamily: 'Reguler',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Asr",
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus
                                                    ?.withOpacity(0.7),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: 3.79.h,
                                          child: VerticalDivider(
                                              color: state.colorStatus
                                                  ?.withOpacity(0.36))),
                                      Column(
                                        children: [
                                          Text(
                                            state.timing?.timings?.maghrib ??
                                                '',
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Maghrib",
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus
                                                    ?.withOpacity(0.7),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: 3.79.h,
                                          child: VerticalDivider(
                                              color: state.colorStatus
                                                  ?.withOpacity(0.36))),
                                      Column(
                                        children: [
                                          Text(
                                            state.timing?.timings?.isha ?? '',
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Isha",
                                            style: TextStyle(
                                                fontFamily: 'Reguler',
                                                color: state.colorStatus
                                                    ?.withOpacity(0.7),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                              : Wrap(),
                        ],
                      )),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.13.h,
                      ),
                      Material(
                        child: InkWell(
                          // splashColor: ui.Color.fromARGB(255, 172, 169, 169),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AlQuranScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: getH(10), top: getH(10)),
                                    padding:
                                        EdgeInsets.fromLTRB(0.w, 1.h, 0.w, 1.h),
                                    width: 6.63.h,
                                    height: 6.63.h,
                                    decoration: BoxDecoration(
                                      color: getColorFromHex(
                                          ColorConstants.titleBackgroundColors),
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                    ),
                                    child: Center(
                                      child: Lottie.asset(
                                          "assets/icons/Quran.json"),
                                    ),
                                  ),
                                  CustomText(
                                    textalign: TextAlign.center,
                                    text: 'Al Quran',
                                    familytype: 1,
                                    textsize: 18.sp,
                                    marginvalue: EdgeInsets.only(
                                      left: 4.w,
                                    ),
                                    textcolor:
                                        getColorFromHex(ColorConstants.black),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: getColorFromHex(ColorConstants.green),
                                size: 22.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          // splashColor: ui.Color.fromARGB(255, 172, 169, 169),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            // builder: (_) => const AlQuranScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: getH(10), top: getH(10)),
                                    padding: EdgeInsets.fromLTRB(
                                        0.w, 0.7.h, 0.w, 0.7.h),
                                    width: 6.63.h,
                                    height: 6.63.h,
                                    decoration: BoxDecoration(
                                      color: getColorFromHex(
                                          ColorConstants.titleBackgroundColors),
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                    ),
                                    child:
                                        Lottie.asset("assets/icons/Sukun.json"),
                                  ),
                                  CustomText(
                                    textalign: TextAlign.center,
                                    text: "Sukoon",
                                    familytype: 1,
                                    textsize: 18.sp,
                                    marginvalue: EdgeInsets.only(
                                      left: 4.w,
                                    ),
                                    textcolor:
                                        getColorFromHex(ColorConstants.black),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: getColorFromHex(ColorConstants.green),
                                size: 22.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          // splashColor: ui.Color.fromARGB(255, 172, 169, 169),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => FeedScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: getH(10), top: getH(10)),
                                    padding:
                                        EdgeInsets.fromLTRB(0.w, 1.h, 0.w, 1.h),
                                    width: 6.63.h,
                                    height: 6.63.h,
                                    decoration: BoxDecoration(
                                      color: getColorFromHex(
                                          ColorConstants.titleBackgroundColors),
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                    ),
                                    child: Lottie.asset(
                                        "assets/icons/Sunnat.json"),
                                  ),
                                  CustomText(
                                    textalign: TextAlign.center,
                                    text: "Sunnat",
                                    familytype: 1,
                                    textsize: 18.sp,
                                    marginvalue: EdgeInsets.only(
                                      left: 4.w,
                                    ),
                                    textcolor:
                                        getColorFromHex(ColorConstants.black),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: getColorFromHex(ColorConstants.green),
                                size: 22.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  )),
              homeRes != null
                  ? Container(
                      padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                      width: MediaQuery.of(context).size.width,
                      height: 30.38.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.sp),
                        child: Swiper(
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              "${homeRes.slider![index].image}",
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: homeRes.slider!.length,
                          loop: false,
                          pagination: homeRes.slider!.length == 1
                              ? null
                              : const SwiperPagination(),
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/static_banner_image.png',
                          width: size.width,
                          height: size.width / 2.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              ValueListenableBuilder<int>(
                  valueListenable: currentPage,
                  builder: (context, value, child) {
                    return homeRes?.perOfTheDay != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Container(
                                    padding:
                                        EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                                    alignment: Alignment.topLeft,
                                    child: Row(children: [
                                      Container(
                                        height: 6.67.w, width: 6.67.w,
                                        padding: EdgeInsets.all(2.w),
                                        margin:
                                            EdgeInsets.only(right: getW(10)),
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        // child: const Icon(
                                        //   Icons.calendar_today_outlined,
                                        //   color: Colors.blue,
                                        // ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${homeRes?.perOfTheDay![currentPage.value].name}",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ])),
                              ])
                        : Container();
                  }),
              homeRes != null
                  ? Container(
                      padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
                      width: MediaQuery.of(context).size.width,
                      height: 47.38.h,
                      // color: Colors.blue,
                      child: Swiper(
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return RepaintBoundary(
                            key: previewContainer,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.sp),
                              child: Image.network(
                                "${homeRes.perOfTheDay![index].image}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        itemCount: homeRes.perOfTheDay != null
                            ? homeRes.perOfTheDay!.length
                            : 0,
                        loop: false,
                        onIndexChanged: (value) {
                          currentPage.value = value;
                        },
                        // pagination: homeRes.perOfTheDay!.length == 1
                        //     ? null
                        //     : const SwiperPagination(),
                      ),
                    )
                  : Container(),
              ValueListenableBuilder<int>(
                  valueListenable: currentPage,
                  builder: (context, value, child) {
                    return homeRes?.perOfTheDay != null
                        ? Container(
                            // color: Colors.teal,
                            padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
                            // height: 2.5.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    homeCubit?.likePOST(
                                        context,
                                        "${homeRes?.perOfTheDay![currentPage.value].id}",
                                        homeRes?.perOfTheDay![currentPage.value]
                                                    .isLike ==
                                                true
                                            ? "0"
                                            : "1");
                                  },
                                  icon: Icon(
                                    homeRes?.perOfTheDay![currentPage.value]
                                                .isLike ==
                                            true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                    size: 20.sp,
                                  ),
                                ),
                                CustomText(
                                  align: Alignment.center,
                                  // textalign: TextAlign.center,
                                  text:
                                      "${homeRes?.perOfTheDay![currentPage.value].totalLike}",
                                  familytype: 2,
                                  textsize: 14.sp,
                                  marginvalue: EdgeInsets.only(left: 0.w),
                                  textcolor:
                                      getColorFromHex(ColorConstants.black),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    _onShareData(
                                        "${homeRes?.perOfTheDay![currentPage.value].image}");
                                  },
                                  child: Container(
                                    width: 3.55.h,
                                    height: 3.55.h,
                                    margin: EdgeInsets.only(right: 2.w),
                                    decoration: BoxDecoration(
                                      color: getColorFromHex(
                                          ColorConstants.whitishgrey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6.sp),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: Lottie.asset(
                                          "assets/icons/Share.json"),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 3.55.h,
                                  height: 3.55.h,
                                  margin: EdgeInsets.only(right: 2.w),
                                  decoration: BoxDecoration(
                                    color: getColorFromHex(
                                        ColorConstants.whitishgrey),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.sp),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: Lottie.asset(
                                        "assets/icons/upload.json"),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container();
                  }),
              homeRes?.perOfTheDay != null
                  ? SizedBox(
                      height: 2.h,
                    )
                  : Container(),
              Container(
                height: 25.38.h,
                padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: homeRes != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.sp),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => const SizedBox(
                              width: 3,
                              height: 3,
                              child:
                                  Center(child: CircularProgressIndicator())),
                          imageUrl: "${homeRes.verseOfTheDay!.image}",
                          fit: BoxFit.fill,
                        ))
                    : Container(),
              ),
              SizedBox(
                height: getH(100),
              ),
            ]),
          ),
        );
      },
    );
  }

  _onShareData(String url) async {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    String directory = "";
    return Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary boundary = previewContainer.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      if (Platform.isIOS) {
        directory = (await getTemporaryDirectory()).path;
      } else {
        directory = (await getApplicationDocumentsDirectory()).path;
      }
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      File imgFile = File('$directory/picoftheday.jpg');
      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes!).then((value) async {
        // tapShare2=true;
        try {
          await Share.shareFiles(imagePaths,
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        } catch (Exception) {}
      }).catchError((onError) {
        print(onError);
      });
    });
  }
}
