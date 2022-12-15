import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/cubits/home_cubit/home_cubit.dart';
import 'package:linger/ui/AlQuran/AlQuranDetailedScreen.dart';
import 'package:linger/ui/AlQuran/AlQuranListScreen.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:linger/Basepackage/baseclass.dart';

class AlQuranScreen extends StatefulWidget {
  const AlQuranScreen({Key? key}) : super(key: key);

  @override
  State<AlQuranScreen> createState() => _AlQuranScreenState();
}

class _AlQuranScreenState extends State<AlQuranScreen> with baseclass {
  late final HomeCubit homeCubit;
  bool isBright = true;
  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state.quran == null) {
          return const ScreenContainer(
            title: '    ',
            leadingWidth: 0,
            leading: SizedBox(),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: state.themeModal!.screenColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 8.2.h,
              leading: Container(
                // color: Colors.blue,
                child: IconButton(
                    padding: EdgeInsets.fromLTRB(4.2.w, 0, 0, 0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: state.themeModal!.iconColor,
                      size: 20.sp,
                    )),
              ),
              titleSpacing: 7.3.w,
              title: CustomText(
                text: 'Al Quran',
                familytype: 2,
                linecount: 1,
                textcolor: state.themeModal!.textColor,
                // marginvalue:  EdgeInsets.only(left: 4.w),
                textsize: 20.sp,
                align: Alignment.centerLeft,
              ),
              elevation: 0,
              backgroundColor: state.themeModal!.appBar,
              leadingWidth: 8.2.w,
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBright = !isBright;
                    });
                    homeCubit.getTheme(isBright);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 3.2.w),
                    child: Icon(Icons.contrast,
                        color: state.themeModal!.iconColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3.2.w),
                  child:
                      Icon(Icons.bookmark, color: state.themeModal!.iconColor),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3.2.w),
                  child: Icon(Icons.search, color: state.themeModal!.iconColor),
                ),
              ],
              bottom: TabBar(
                // controller: _tabController,
                isScrollable: true,
                labelColor: getColorFromHex(ColorConstants.greencolor),
                unselectedLabelColor:
                    state.themeModal!.textColor.withOpacity(0.6),
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 3.w),
                indicatorColor: getColorFromHex(ColorConstants.greencolor),

                unselectedLabelStyle: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: 'Reguler',
                ),
                labelStyle: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: 'Reguler',
                ),
                onTap: (index) {},
                tabs: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Tab(
                      text: 'Surah',
                    ),
                  ),
                  // SizedBox(width: 15.w, child: const Tab(text: 'Unpaid')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Tab(
                      text: 'Juz',
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        List.generate(state.quran!.surah!.length, (index) {
                      return Material(
                          color: state.themeModal!.cardsColors,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AlQuranDetailedScreen(
                                            themeData: state.themeModal!,
                                            number: state
                                                .quran!.surah![index].number!,
                                            type: 'surah',
                                            surah:
                                                state.quran!.surah![index])));
                              },
                              child: AlQuranListScreen(
                                themeData: state.themeModal!,
                                surah: state.quran!.surah![index],
                              )));
                    }),
                    // children: List.generate(state.cart?.length ?? 0, (index) {
                    //   final cart = state.cart![index];

                    //   return CartView.newInstance(cart, state.seeAllproducts!.product);
                    // })
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(state.quran!.juz!.length, (index) {
                      return Material(
                          color: state.themeModal!.cardsColors,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AlQuranDetailedScreen(
                                            themeData: state.themeModal!,
                                            number: state
                                                .quran!.juz![index].number!,
                                            type: 'juz',
                                            juz: state.quran!.juz![index])));
                              },
                              child: AlQuranListScreen(
                                  themeData: state.themeModal!,
                                  juz: state.quran!.juz![index])));
                    }),
                    // children: List.generate(state.cart?.length ?? 0, (index) {
                    //   final cart = state.cart![index];

                    //   return CartView.newInstance(cart, state.seeAllproducts!.product);
                    // })
                  ),
                ),
              ],
            ),
          );

          // Scaffold(
          //         backgroundColor: Colors.white,
          //         appBar: AppBar(
          //           toolbarHeight: 10.66.h,
          //           bottom: TabBar(
          //             // controller: _tabController,
          //             isScrollable: true,
          //             labelColor: getColorFromHex(ColorConstants.greencolor),
          //             unselectedLabelColor:
          //                 getColorFromHex(ColorConstants.greycolor)
          //                     .withOpacity(0.6),
          //             indicatorSize: TabBarIndicatorSize.label,
          //             labelPadding: EdgeInsets.symmetric(horizontal: 3.w),
          //             indicatorColor: getColorFromHex(ColorConstants.greencolor),

          //             unselectedLabelStyle: TextStyle(
          //               fontSize: 17.sp,
          //               fontFamily: 'Reguler',
          //             ),
          //             labelStyle: TextStyle(
          //               fontSize: 17.sp,
          //               fontFamily: 'Reguler',
          //             ),
          //             onTap: (index) {},
          //             tabs: [
          //               SizedBox(
          //                 width: 15.w,
          //                 child: const Tab(
          //                   text: 'All',
          //                 ),
          //               ),
          //               // SizedBox(width: 15.w, child: const Tab(text: 'Unpaid')),
          //               SizedBox(
          //                 width: 20.w,
          //                 child: const Tab(
          //                   text: 'To ship',
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 20.w,
          //                 child: const Tab(
          //                   text: 'Shipped',
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 22.w,
          //                 child: const Tab(
          //                   text: 'Completed',
          //                 ),
          //               ),
          //             ],
          //           ),
          //           leading: IconButton(
          //               padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
          //               onPressed: _onSearchButtonPressed,
          //               icon: Icon(
          //                 Icons.arrow_back_ios,
          //                 color: Colors.black,
          //                 size: 20.sp,
          //               )),
          //           titleSpacing: 7.3.w,
          //           title: CustomText(
          //             text: 'Orders',
          //             familytype: 2,
          //             linecount: 1,
          //             textcolor: Colors.black,
          //             // marginvalue: EdgeInsets.only(left: 6.w),
          //             textsize: 20.sp,
          //             align: Alignment.centerLeft,
          //           ),
          //           elevation: 0,
          //           backgroundColor: Colors.white,
          //           leadingWidth: 8.2.w,
          //         ),
          //         body: TabBarView(
          //           children: [
          //             SingleChildScrollView(
          //               physics: const BouncingScrollPhysics(),
          //               child: Container(
          //                 color: getColorFromHex(ColorConstants.greycolor)
          //                     .withOpacity(0.1),
          //                 child: Column(
          //                   children: state.myOrder!.data
          //                           ?.where((el) =>
          //                               (el.order?.isNotEmpty ?? false) &&
          //                               (el.productId != 0))
          //                           .toList()
          //                           .map((e) {
          //                         return GestureDetector(
          //                           onTap: () {
          //                             Navigator.push(
          //                                 context,
          //                                 MaterialPageRoute(
          //                                     builder: (_) => OrderStatusScreen(
          //                                           oid: e.orderid,
          //                                         )));
          //                           },
          //                           child: ProductOrderView(
          //                             orderNumber: '${e.orderid}',
          //                             // statusName: "${e.order?.first.paymentStatus}",
          //                             statusName: paymentStatus[e.orderStatus]!,
          //                             statusColor: getColorFromHex(
          //                                 statusColor[e.orderStatus]!),
          //                             // statusColor: getColorFromHex(
          //                             //     ColorConstants.systembluecolor),

          //                             items: e,
          //                             showOrderIcon: true,
          //                             totalCost: TotalCast(
          //                                 '${e.order?.length} items: ${e.total}.00 ₹'),
          //                             shopProduct: state.seeAllproducts!.product!,
          //                           ),
          //                         );
          //                       }).toList() ??
          //                       [],
          //                 ),
          //               ),
          //             ),
          //             // SingleChildScrollView(
          //             //   physics: const BouncingScrollPhysics(),
          //             //   child: Container(
          //             //     color: getColorFromHex(ColorConstants.greycolor)
          //             //         .withOpacity(0.1),
          //             //     child: Column(
          //             //       children: state.myOrder!.data
          //             //               ?.where((el) =>
          //             //                   (el.order?.isNotEmpty ?? false) &&
          //             //                   (el.paymentStatus == "unpaid"))
          //             //               .toList()
          //             //               .map((e) {
          //             //             return GestureDetector(
          //             //                 onTap: () {
          //             //                   Navigator.push(
          //             //                       context,
          //             //                       MaterialPageRoute(
          //             //                           builder: (_) => OrderStatusScreen(
          //             //                                 oid: e.orderid,
          //             //                               )));
          //             //                 },
          //             //                 child: ProductOrderView(
          //             //                     orderNumber: '${e.orderid}',
          //             //                     // statusName: "${e.order?.first.paymentStatus}",
          //             //                     statusName: paymentStatus[e.orderStatus]!,
          //             //                     statusColor: getColorFromHex(
          //             //                         statusColor[e.orderStatus]!),
          //             //                     items: e,
          //             //                     showOrderIcon: true,
          //             //                     totalCost: TotalCast(
          //             //                         '${e.order?.length} items: ${e.total}.00 ₹'),
          //             //                     shopProduct:
          //             //                         state.seeAllproducts!.product!));
          //             //           }).toList() ??
          //             //           [],
          //             //     ),
          //             //   ),
          //             // ),

          //             SingleChildScrollView(
          //               physics: const BouncingScrollPhysics(),
          //               child: Container(
          //                 color: getColorFromHex(ColorConstants.greycolor)
          //                     .withOpacity(0.1),
          //                 child: Column(
          //                   children: state.myOrder!.data
          //                           ?.where((el) =>
          //                               (el.order?.isNotEmpty ?? false) &&
          //                               (el.orderStatus == 1) &&
          //                               (el.productId != 0))
          //                           .toList()
          //                           .map((e) {
          //                         return GestureDetector(
          //                             onTap: () {
          //                               Navigator.push(
          //                                   context,
          //                                   MaterialPageRoute(
          //                                       builder: (_) => OrderStatusScreen(
          //                                             oid: e.orderid,
          //                                           )));
          //                             },
          //                             child: ProductOrderView(
          //                                 orderNumber: '${e.orderid}',
          //                                 // statusName: "${e.order?.first.paymentStatus}",
          //                                 statusName: paymentStatus[e.orderStatus]!,
          //                                 statusColor: getColorFromHex(
          //                                     statusColor[e.orderStatus]!),
          //                                 items: e,
          //                                 showOrderIcon: true,
          //                                 totalCost: TotalCast(
          //                                     '${e.order?.length} items: ${e.total}.00 ₹'),
          //                                 shopProduct:
          //                                     state.seeAllproducts!.product!));
          //                       }).toList() ??
          //                       [],
          //                 ),
          //               ),
          //             ),
          //             SingleChildScrollView(
          //               physics: const BouncingScrollPhysics(),
          //               child: Container(
          //                 color: getColorFromHex(ColorConstants.greycolor)
          //                     .withOpacity(0.1),
          //                 child: Column(
          //                   children: state.myOrder!.data
          //                           ?.where((el) =>
          //                               (el.order?.isNotEmpty ?? false) &&
          //                               (el.orderStatus == 2) &&
          //                               (el.productId != 0))
          //                           .toList()
          //                           .map((e) {
          //                         return GestureDetector(
          //                             onTap: () {
          //                               Navigator.push(
          //                                   context,
          //                                   MaterialPageRoute(
          //                                       builder: (_) => OrderStatusScreen(
          //                                             oid: e.orderid,
          //                                           )));
          //                             },
          //                             child: ProductOrderView(
          //                                 orderNumber: '${e.orderid}',
          //                                 // statusName: "${e.order?.first.paymentStatus}",
          //                                 statusName: paymentStatus[e.orderStatus]!,
          //                                 statusColor: getColorFromHex(
          //                                     statusColor[e.orderStatus]!),
          //                                 items: e,
          //                                 showOrderIcon: true,
          //                                 totalCost: TotalCast(
          //                                     '${e.order?.length} items: ${e.total}.00 ₹'),
          //                                 shopProduct:
          //                                     state.seeAllproducts!.product!));
          //                       }).toList() ??
          //                       [],
          //                 ),
          //               ),
          //             ),
          //             SingleChildScrollView(
          //               physics: const BouncingScrollPhysics(),
          //               child: Container(
          //                 color: getColorFromHex(ColorConstants.greycolor)
          //                     .withOpacity(0.1),
          //                 child: Column(
          //                   children: state.myOrder!.data
          //                           ?.where((el) =>
          //                               (el.order?.isNotEmpty ?? false) &&
          //                               (el.orderStatus == 3) &&
          //                               (el.productId != 0))
          //                           .toList()
          //                           .map((e) {
          //                         return GestureDetector(
          //                             onTap: () {
          //                               Navigator.push(
          //                                   context,
          //                                   MaterialPageRoute(
          //                                       builder: (_) => OrderStatusScreen(
          //                                             oid: e.orderid,
          //                                           )));
          //                             },
          //                             child: ProductOrderView(
          //                                 orderNumber: '${e.orderid}',
          //                                 // statusName: "${e.order?.first.paymentStatus}",
          //                                 statusName: paymentStatus[e.orderStatus]!,
          //                                 statusColor: getColorFromHex(
          //                                     statusColor[e.orderStatus]!),
          //                                 items: e,
          //                                 showOrderIcon: true,
          //                                 totalCost: TotalCast(
          //                                     '${e.order?.length} items: ${e.total}.00 ₹'),
          //                                 shopProduct:
          //                                     state.seeAllproducts!.product!));
          //                       }).toList() ??
          //                       [],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );

        }
      }),
    );
  }
}
