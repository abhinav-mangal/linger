import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/orders/view/order_cancel_screen.dart';
import 'package:linger/ui/orders/view/order_item_view.dart';
import 'package:linger/ui/orders/view/product_order_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../cubits/shop/shop_cubit.dart';
import '../widgets/screen_conatiner.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key, this.oid}) : super(key: key);
  final String? oid;

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> with baseclass {
  late final ShopCubit shopcubit;

  @override
  void initState() {
    shopcubit = context.read<ShopCubit>();
    shopcubit.getOrderDetail(widget.oid ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.loading ?? false) {
          return const ScreenContainer(
            title: '    ',
            leadingWidth: 0,
            leading: SizedBox(),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final vieworder = state.orderDetailModel?.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              leading: IconButton(
                  onPressed: () {
                    final router = getItInjector<AppRouter>();
                    router.pop();
                    // setState(() {
                    //   final router = getItInjector<AppRouter>();
                    //   AppRouter.getParameters(Index: 0);
                    //   router.pushAndPopUntil(const HomeRoute(),
                    //       predicate: (Route<dynamic> route) {
                    //     return false;
                    //   });

                    //   // Navigator.of(context).pushReplacement(
                    //   //   MaterialPageRoute(
                    //   //       builder: (context) => const HomePage(
                    //   //             index: 0,
                    //   //           )),
                    //   // );
                    // });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: theme.textTheme.titleMedium?.color,
                  )),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  orderstatus(context, "${vieworder?.order?.orderStatus}"),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 19.7.h,
                    // height: getHeight(context)*0.2,
                    // margin:  EdgeInsets.only(left:4.6.w,right:4.6.w,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: state.myOrderAddress?.data![0].name ?? '',
                              familytype: 2,
                              linecount: 1,
                              textcolor: Colors.black,
                              textsize: 17.sp,
                              align: Alignment.center,
                            ),
                            // const Spacer(),
                            // CustomText(
                            //   text: 'Edit',
                            //   familytype: 2,
                            //   linecount: 1,
                            //   textcolor:
                            //       getColorFromHex(ColorConstants.greencolor),
                            //   textsize: 17.sp,
                            //   align: Alignment.center,
                            // ),
                          ],
                        ),
                        CustomText(
                          text:
                              '(+91) ${state.myOrderAddress?.data![0].mobileNumber}',
                          familytype: 1,
                          linecount: 1,
                          textcolor: getColorFromHex(ColorConstants.greycolor)
                              .withOpacity(0.6),
                          textsize: 15.sp,
                          marginvalue: const EdgeInsets.only(top: 8, bottom: 4),
                          align: Alignment.centerLeft,
                        ),
                        CustomText(
                          text: '${state.myOrderAddress?.data![0].address}',
                          familytype: 1,
                          linecount: 2,
                          textcolor: getColorFromHex(ColorConstants.greycolor)
                              .withOpacity(0.6),
                          textsize: 15.sp,
                          // marginvalue: const EdgeInsets.only(top:8,bottom: 8),
                          align: Alignment.centerLeft,
                        ),
                        CustomText(
                          text:
                              '${state.myOrderAddress?.data![0].city}, ${state.myOrderAddress?.data![0].state}',
                          familytype: 1,
                          linecount: 1,
                          textcolor: getColorFromHex(ColorConstants.greycolor)
                              .withOpacity(0.6),
                          textsize: 15.sp,
                          marginvalue: const EdgeInsets.only(top: 4, bottom: 4),
                          align: Alignment.centerLeft,
                        ),
                        CustomText(
                          text: '${state.myOrderAddress?.data![0].postcode}',
                          familytype: 1,
                          linecount: 1,
                          textcolor: getColorFromHex(ColorConstants.greycolor)
                              .withOpacity(0.6),
                          textsize: 15.sp,
                          align: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    // padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ProductOrderView(
                          orderNumber:
                              vieworder?.shopProduct?.length.toString() ?? '',
                          statusName: "",
                          statusColor:
                              getColorFromHex(ColorConstants.systembluecolor),
                          itemViews: vieworder?.shopProduct != null
                              ? Column(
                                  children: vieworder?.shopProduct?.map((e) {
                                        return OrderItemView(
                                          e.productImage,
                                          e.productName,
                                          '',
                                          e.price.toString(),
                                          e.quantity.toString(),
                                        );
                                      }).toList() ??
                                      [],
                                )
                              : const SizedBox(),
                          // items: const OrderList(
                          //   orderid: '',
                          //   order: [],
                          // ),
                          showOrderIcon: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    // height:getH(160),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: getH(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Subtotal',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${vieworder?.order?.subtotal} ₹',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getH(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Shipping',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${vieworder?.order?.shippingAmount} ₹',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getH(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Total',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${vieworder?.order?.total} ₹',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Detail',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Order number',
                              familytype: 7,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 16.sp,
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${vieworder?.order?.oid}',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Payment method',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${vieworder?.order?.paymentMethod}',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Order date',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${vieworder?.order?.orderDate}',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  vieworder!.order!.orderStatus == 4 ||
                          vieworder.order!.orderStatus == 5
                      ? Container(
                          height: getH(56),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.sp),
                            color: getColorFromHex(ColorConstants.green),
                          ),
                          child: Text(
                            'Buy again',
                            style: TextStyle(
                                color: getColorFromHex(ColorConstants.white),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderCancelScreen(oid: widget.oid)));
                            // shopcubit.cancelOrderById(context, widget.oid!);
                          },
                          child: Container(
                            height: getH(56),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.sp),
                                color: const Color.fromRGBO(255, 59, 48, 0.12),
                                border: Border.all(
                                  color: Colors.red,
                                )),
                            child: Text(
                              'Cancel order',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        final router = getItInjector<AppRouter>();
                        AppRouter.getParameters(Index: 0);
                        router.pushAndPopUntil(const HomeRoute(index: 0),
                            predicate: (Route<dynamic> route) {
                          return false;
                        });

                        //   // Navigator.of(context).pushReplacement(
                        //   //   MaterialPageRoute(
                        //   //       builder: (context) => const HomePage(
                        //   //             index: 0,
                        //   //           )),
                        //   // );
                      });
                    },
                    child: Container(
                      height: getH(56),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                          color: const Color.fromARGB(30, 100, 255, 48),
                          border: Border.all(
                            color: getColorFromHex(ColorConstants.green),
                          )),
                      child: Text(
                        'Back to Home',
                        style: TextStyle(
                            color: getColorFromHex(ColorConstants.green),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget orderstatus(BuildContext context, String orderStatus) {
    final theme = Theme.of(context);
    switch (orderStatus) {
      case "0":
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.file_copy_rounded,
                      color: getColorFromHex('#007AFF'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Preparing order',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: getColorFromHex('#007AFF'),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'The seller is preparing orders for you',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 16.sp,
                align: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Est. delivery by Apr 22 - Apr 27',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
            ],
          ),
        );
      case "1":
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.file_copy_rounded,
                      color: getColorFromHex('#007AFF'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'To Ship',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: getColorFromHex('#007AFF'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Your order has been packed and is awaiting shipping',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Est. delivery by Apr 22 - Apr 27',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
            ],
          ),
        );
      case "2":
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.file_copy_rounded,
                      color: getColorFromHex('#007AFF'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Shipped',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: getColorFromHex('#007AFF'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Your order is being shipped to you',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Est. delivery by Apr 22 - Apr 27',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
            ],
          ),
        );
      case "3":
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.check_circle,
                      color: getColorFromHex('#34C759'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Completed',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: getColorFromHex('#34C759'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Your order is now complete',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
            ],
          ),
        );
      case "4":
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
          padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.check_circle,
                      color: getColorFromHex('#000000'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Canceled',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: getColorFromHex('#000000'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'You have canceled your order',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 15.sp,
                align: Alignment.centerLeft,
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
