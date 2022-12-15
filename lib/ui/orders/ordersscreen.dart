import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_product.dart';
import 'package:linger/ui/orders/order_status_screen.dart';
import 'package:linger/ui/orders/order_summary_screen.dart';
import 'package:linger/ui/orders/view/product_order_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/customText.dart';
import '../widgets/screen_conatiner.dart';

Map<int, String> paymentStatus = {
  0: "Preparing Order",
  1: "To Ship",
  2: "Shipped",
  3: "Completed",
  4: "Canceled",
  5: "Unpaid"
};
Map<int, String> statusColor = {
  0: ColorConstants.textverifyFieldColor,
  1: ColorConstants.textverifyFieldColor,
  2: ColorConstants.textverifyFieldColor,
  3: ColorConstants.systemgreencolor,
  4: ColorConstants.black,
  5: ColorConstants.systemredcolor
};

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with baseclass, SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this, length: 5);
    // _tabController?.addListener(_handleTabSelection);
  }

  // void _handleTabSelection() {
  //   setState(() {});
  // }
  void _onSearchButtonPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state.myOrder == null) {
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
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 10.66.h,
                bottom: TabBar(
                  // controller: _tabController,
                  isScrollable: true,
                  labelColor: getColorFromHex(ColorConstants.greencolor),
                  unselectedLabelColor:
                      getColorFromHex(ColorConstants.greycolor)
                          .withOpacity(0.6),
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
                      width: 15.w,
                      child: const Tab(
                        text: 'All',
                      ),
                    ),
                    // SizedBox(width: 15.w, child: const Tab(text: 'Unpaid')),
                    SizedBox(
                      width: 20.w,
                      child: const Tab(
                        text: 'To ship',
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                      child: const Tab(
                        text: 'Shipped',
                      ),
                    ),
                    SizedBox(
                      width: 22.w,
                      child: const Tab(
                        text: 'Completed',
                      ),
                    ),
                  ],
                ),
                leading: IconButton(
                    padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                    onPressed: _onSearchButtonPressed,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.sp,
                    )),
                titleSpacing: 7.3.w,
                title: CustomText(
                  text: 'Orders',
                  familytype: 2,
                  linecount: 1,
                  textcolor: Colors.black,
                  // marginvalue: EdgeInsets.only(left: 6.w),
                  textsize: 20.sp,
                  align: Alignment.centerLeft,
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                leadingWidth: 8.2.w,
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      color: getColorFromHex(ColorConstants.greycolor)
                          .withOpacity(0.1),
                      child: Column(
                        children: state.myOrder!.data
                                ?.where((el) =>
                                    (el.order?.isNotEmpty ?? false) &&
                                    (el.productId != 0))
                                .toList()
                                .map((e) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => OrderStatusScreen(
                                                oid: e.orderid,
                                              )));
                                },
                                child: ProductOrderView(
                                  orderNumber: '${e.orderid}',
                                  // statusName: "${e.order?.first.paymentStatus}",
                                  statusName: paymentStatus[e.orderStatus]!,
                                  statusColor: getColorFromHex(
                                      statusColor[e.orderStatus]!),
                                  // statusColor: getColorFromHex(
                                  //     ColorConstants.systembluecolor),

                                  items: e,
                                  showOrderIcon: true,
                                  totalCost: TotalCast(
                                      '${e.order?.length} items: ${e.total}.00 ₹'),
                                  shopProduct: state.seeAllproducts!.product!,
                                ),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                  ),
                  // SingleChildScrollView(
                  //   physics: const BouncingScrollPhysics(),
                  //   child: Container(
                  //     color: getColorFromHex(ColorConstants.greycolor)
                  //         .withOpacity(0.1),
                  //     child: Column(
                  //       children: state.myOrder!.data
                  //               ?.where((el) =>
                  //                   (el.order?.isNotEmpty ?? false) &&
                  //                   (el.paymentStatus == "unpaid"))
                  //               .toList()
                  //               .map((e) {
                  //             return GestureDetector(
                  //                 onTap: () {
                  //                   Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (_) => OrderStatusScreen(
                  //                                 oid: e.orderid,
                  //                               )));
                  //                 },
                  //                 child: ProductOrderView(
                  //                     orderNumber: '${e.orderid}',
                  //                     // statusName: "${e.order?.first.paymentStatus}",
                  //                     statusName: paymentStatus[e.orderStatus]!,
                  //                     statusColor: getColorFromHex(
                  //                         statusColor[e.orderStatus]!),
                  //                     items: e,
                  //                     showOrderIcon: true,
                  //                     totalCost: TotalCast(
                  //                         '${e.order?.length} items: ${e.total}.00 ₹'),
                  //                     shopProduct:
                  //                         state.seeAllproducts!.product!));
                  //           }).toList() ??
                  //           [],
                  //     ),
                  //   ),
                  // ),

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      color: getColorFromHex(ColorConstants.greycolor)
                          .withOpacity(0.1),
                      child: Column(
                        children: state.myOrder!.data
                                ?.where((el) =>
                                    (el.order?.isNotEmpty ?? false) &&
                                    (el.orderStatus == 1) &&
                                    (el.productId != 0))
                                .toList()
                                .map((e) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => OrderStatusScreen(
                                                  oid: e.orderid,
                                                )));
                                  },
                                  child: ProductOrderView(
                                      orderNumber: '${e.orderid}',
                                      // statusName: "${e.order?.first.paymentStatus}",
                                      statusName: paymentStatus[e.orderStatus]!,
                                      statusColor: getColorFromHex(
                                          statusColor[e.orderStatus]!),
                                      items: e,
                                      showOrderIcon: true,
                                      totalCost: TotalCast(
                                          '${e.order?.length} items: ${e.total}.00 ₹'),
                                      shopProduct:
                                          state.seeAllproducts!.product!));
                            }).toList() ??
                            [],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      color: getColorFromHex(ColorConstants.greycolor)
                          .withOpacity(0.1),
                      child: Column(
                        children: state.myOrder!.data
                                ?.where((el) =>
                                    (el.order?.isNotEmpty ?? false) &&
                                    (el.orderStatus == 2) &&
                                    (el.productId != 0))
                                .toList()
                                .map((e) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => OrderStatusScreen(
                                                  oid: e.orderid,
                                                )));
                                  },
                                  child: ProductOrderView(
                                      orderNumber: '${e.orderid}',
                                      // statusName: "${e.order?.first.paymentStatus}",
                                      statusName: paymentStatus[e.orderStatus]!,
                                      statusColor: getColorFromHex(
                                          statusColor[e.orderStatus]!),
                                      items: e,
                                      showOrderIcon: true,
                                      totalCost: TotalCast(
                                          '${e.order?.length} items: ${e.total}.00 ₹'),
                                      shopProduct:
                                          state.seeAllproducts!.product!));
                            }).toList() ??
                            [],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      color: getColorFromHex(ColorConstants.greycolor)
                          .withOpacity(0.1),
                      child: Column(
                        children: state.myOrder!.data
                                ?.where((el) =>
                                    (el.order?.isNotEmpty ?? false) &&
                                    (el.orderStatus == 3) &&
                                    (el.productId != 0))
                                .toList()
                                .map((e) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => OrderStatusScreen(
                                                  oid: e.orderid,
                                                )));
                                  },
                                  child: ProductOrderView(
                                      orderNumber: '${e.orderid}',
                                      // statusName: "${e.order?.first.paymentStatus}",
                                      statusName: paymentStatus[e.orderStatus]!,
                                      statusColor: getColorFromHex(
                                          statusColor[e.orderStatus]!),
                                      items: e,
                                      showOrderIcon: true,
                                      totalCost: TotalCast(
                                          '${e.order?.length} items: ${e.total}.00 ₹'),
                                      shopProduct:
                                          state.seeAllproducts!.product!));
                            }).toList() ??
                            [],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class TotalCast extends StatelessWidget with baseclass {
  TotalCast(this.itemtotal, {Key? key}) : super(key: key);
  final String? itemtotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        CustomText(
          text: itemtotal ?? '',
          familytype: 1,
          linecount: 1,
          textcolor: getColorFromHex(ColorConstants.black),
          textsize: 16.sp,
          fontWeight: FontWeight.w500,
          align: Alignment.centerLeft,
        ),
        SizedBox(
          width: 2.w,
        ),
      ],
    );
  }
}
