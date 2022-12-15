import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/homescreen.dart';
import 'package:linger/ui/morescreen.dart';
import 'package:linger/ui/quize/leaderboardscreen.dart';
import 'package:linger/ui/quize/quizscreen.dart';
import 'package:linger/ui/shope/ShopScreen.dart';
import 'package:linger/ui/university/universityscreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/AssetImage.dart';
import '../Utils/CommonUtils.dart';
import '../Utils/customText.dart';
// import '../models/homepage/TimingResponse.dart';
import '../Utils/custombottomnavigatorbar.dart';

class HomePage extends StatefulWidget {
  final int? index;
  final Function? onIndexChange;
  const HomePage({Key? key, this.index, this.onIndexChange}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with baseclass {
  DateTime dateTime = DateTime.now();
  BoxDecoration decoration = const BoxDecoration();
  int _onBottomselectedIndex = 2;

  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
      title: CustomText(
        textalign: TextAlign.center,
        text: "Shop",
        familytype: 2,
        textsize: 1.42.h,
        textcolor: CommonUtils.getColorFromHex(ColorConstants.black),
      ),
      icon: MyAssetImage(
          height: 3.1.h,
          width: 3.1.h,
          marginvalue: const EdgeInsets.only(bottom: 4),
          imageName: "shop.png"),
    ),
    TitledNavigationBarItem(
      title: CustomText(
        textalign: TextAlign.center,
        text: "University",
        familytype: 2,
        textsize: 1.42.h,
        textcolor: CommonUtils.getColorFromHex(ColorConstants.black),
      ),
      icon: MyAssetImage(
          height: 3.1.h,
          width: 3.1.h,
          marginvalue: const EdgeInsets.only(bottom: 4),
          imageName: "university.png"),
    ),
    TitledNavigationBarItem(
      title: const Text(''),
      icon: Container(),
    ),
    TitledNavigationBarItem(
      title: CustomText(
        textalign: TextAlign.center,
        text: "Gaming",
        familytype: 2,
        textsize: 1.42.h,
        textcolor: CommonUtils.getColorFromHex(ColorConstants.black),
      ),
      icon: MyAssetImage(
          height: 3.1.h,
          width: 3.1.h,
          marginvalue: const EdgeInsets.only(bottom: 4),
          imageName: "quiz.png"),
    ),
    TitledNavigationBarItem(
      title: CustomText(
        textalign: TextAlign.center,
        text: "More",
        familytype: 2,
        textsize: 1.42.h,
        textcolor: CommonUtils.getColorFromHex(ColorConstants.black),
      ),
      icon: MyAssetImage(
          height: 3.1.h,
          marginvalue: const EdgeInsets.only(bottom: 4),
          width: 3.1.h,
          icontint: '',
          imageName: "more.png"),
    ),
  ];
  final List<Widget> _homewidgetOptions = <Widget>[
    const ShopScreen(),
    const UniversityScreen(),
    const HomeScreen(),
    const QuizScreen(),
    const MoreScreen()
  ];

  String prayerName = "";

  // Timings timings = Timings();
  bool loading = true;
  Color colorStatus = Colors.white;
  Duration counter = const Duration(hours: 00, minutes: 00, seconds: 00);

  @override
  void initState() {
    super.initState();
    _onBottomselectedIndex = widget.index ?? 2;
  }

  late Function? onchanged = widget.onIndexChange;
  void _onBottomItemTapped(int pos) {
    setState(() {
      _onBottomselectedIndex = pos;
      /* _pageController.animateToPage(_onBottomselectedIndex,
          duration: Duration(milliseconds: 350), curve: Curves.ease);*/
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _onBottomselectedIndex,
        children: _homewidgetOptions,
      ),
      // body: Center( child: _homewidgetOptions.elementAt(_onBottomselectedIndex)),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 8.17.h,
          child: TitledBottomNavigationBar(
            onTap: (index) {
              _onBottomItemTapped(index);
            },
            reverse: true,
            currentIndex: _onBottomselectedIndex,
            curve: Curves.easeInBack,
            items: items,
            heght: 8.1.h,
            indicatorHeight: 0.5.h,
            activeColor: getColorFromHex(ColorConstants.black),
            inactiveColor: getColorFromHex(ColorConstants.black),
            indicatorColor: getColorFromHex(ColorConstants.greencolor),
            inactiveStripColor:
                getColorFromHex(ColorConstants.white).withOpacity(0.8),
          ),
        ),
      ),
      // BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 8.0,
      //   clipBehavior: Clip.antiAlias,
      //   child: SizedBox(
      //     height: 8.17.h,
      //     child: BottomNavigationBar(
      //         currentIndex: _onBottomselectedIndex,
      //         selectedItemColor: Colors.grey,
      //         unselectedItemColor: Colors.grey,
      //         backgroundColor:  getColorFromHex(ColorConstants.white).withOpacity(0.8),
      //         showUnselectedLabels: true,
      //         type: BottomNavigationBarType.fixed,
      //         onTap:_onBottomItemTapped,
      //         unselectedFontSize:1,
      //         selectedFontSize:1,
      //         items:  [
      //           BottomNavigationBarItem(
      //             label: "",
      //             icon: Column(
      //               mainAxisAlignment : MainAxisAlignment.end,
      //               children: [
      //                 MyAssetImage(
      //                     marginvalue: const EdgeInsets.only(bottom: 4),
      //                     height: 3.1.h,
      //                     width: 3.1.h,
      //                     // onItemtaped: (){},
      //                     imageName: "shop.png"),
      //                 CustomText(
      //                   textalign: TextAlign.center,
      //                   text: "Shop",
      //                   familytype: 2,
      //                   textsize: 1.42.h,
      //                   textcolor: getColorFromHex(ColorConstants.black),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           BottomNavigationBarItem(icon: Column(
      //             mainAxisAlignment : MainAxisAlignment.end,
      //             children: [
      //               MyAssetImage(
      //                   marginvalue: const EdgeInsets.only(bottom: 4),
      //                   height: 3.1.h,
      //                   width: 3.1.h,
      //                   // onItemtaped: (){},
      //                   imageName: "university.png"),
      //               CustomText(
      //                 textalign: TextAlign.center,
      //                 text: "University",
      //                 familytype: 2,
      //                 textsize: 1.42.h,
      //                 textcolor: getColorFromHex(ColorConstants.black),
      //               ),
      //             ],
      //           ), label: ''),
      //           BottomNavigationBarItem(icon:Column(
      //             mainAxisAlignment : MainAxisAlignment.end,
      //             children: [
      //               Container(),
      //             ],
      //           ), label: ''),
      //           BottomNavigationBarItem(icon:Column(
      //             mainAxisAlignment : MainAxisAlignment.end,
      //             children: [
      //               MyAssetImage(
      //                   marginvalue: const EdgeInsets.only(bottom: 4),
      //                   height: 3.1.h,
      //                   width: 3.1.h,
      //                   // onItemtaped: (){},
      //                   imageName: "quiz.png"),
      //               CustomText(
      //                 textalign: TextAlign.center,
      //                 text: "Gaming",
      //                 familytype: 2,
      //                 textsize: 1.42.h,
      //                 textcolor: getColorFromHex(ColorConstants.black),
      //               ),
      //             ],
      //           ), label: ''),
      //           BottomNavigationBarItem(icon:Column(
      //             mainAxisAlignment : MainAxisAlignment.end,
      //             children: [
      //               MyAssetImage(
      //                   marginvalue: const EdgeInsets.only(bottom: 4),
      //                   height: 3.1.h,
      //                   width: 3.1.h,
      //                   icontint: "",
      //                   // onItemtaped: (){},
      //                   imageName: "more.png"),
      //               CustomText(
      //                 textalign: TextAlign.center,
      //                 text: "More",
      //                 familytype: 2,
      //                 textsize: 1.42.h,
      //                 textcolor: getColorFromHex(ColorConstants.black),
      //               ),
      //             ],
      //           ), label: ''),
      //         ]),
      //   ),
      // ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              color: getColorFromHex(ColorConstants.greenshadowcolor)
                  .withOpacity(0.6),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ]),
          height: 6.63.h,
          width: 6.63.h,
          // height: 14.35.w,
          // width: 14.35.w,
          child: FloatingActionButton(
            backgroundColor: getColorFromHex(ColorConstants.lightGreen),
            child: MyAssetImage(
                height: 3.2.h,
                width: 3.2.h,
                // onItemtaped: (){},
                imageName: "home.png"),
            onPressed: () {
              if (mounted) {
                setState(() {
                  _onBottomselectedIndex = 2;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
