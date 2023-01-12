// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/orders/view/order_item_view.dart';
import 'package:linger/ui/orders/view/product_order_view.dart';
import 'package:linger/ui/shipping/shippingaddress.dart';
import 'package:linger/ui/shope/pyment.dart';
import 'package:linger/ui/widgets/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Basepackage/baseclass.dart';
import '../../Controller/coupon_controller.dart';
import '../../Utils/CommonUtils.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

import '../../Utils/flushbar_notification.dart';
import '../../common_screen/successParam.dart';
import '../../locator.dart';
import '../../router/app_routes.gr.dart';
import '../morescreen.dart';
import '../shipping/editShippingAddress.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen>
    with baseclass, PaymentMixin {
  String text = "";
  int maxLength = 200;
  TextEditingController controller = TextEditingController();
  TextEditingController couponController = TextEditingController();
  late final ShopCubit shopCubit;
  late final ProfileCubit profileCubit;

  int? couponAmount;
  bool couponApplied = false;

  @override
  void initState() {
    // TODO: implement initState
    shopCubit = context.read<ShopCubit>();
    profileCubit = context.read<ProfileCubit>();
    shopCubit.getMyOrderSummary();
    super.initState();
  }

  Decoration dec = BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 1, color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 3,
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ],
  );

  String? _getPaymentDesc(ShopState state) {
    if (state.orderSummaryModel!.data != null &&
        state.orderSummaryModel!.data!.cart!.isNotEmpty) {
      return state.orderSummaryModel!.data!.cart!
          .map(
              (e) => 'Product - ${e.productName}, Total Price - ${e.saleprice}')
          .toList()
          .toString();
    } else {
      return null;
    }
  }

  Widget titleui(String title) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 6.6.h,
            child: ListTile(
              leading: Icon(
                Icons.close,
                color: Colors.black,
                size: 19.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.6.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: CustomText(
                    text: title,
                    familytype: 2,
                    linecount: 1,
                    textcolor: Colors.black,
                    textsize: 17.sp,
                    align: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8.2.h,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              color: Colors.transparent,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  ))),
        ),
        titleSpacing: 7.3.w,
        title: CustomText(
          text: 'Order Summary',
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          // marginvalue:  EdgeInsets.only(left: 4.w),
          textsize: 20.sp,
          align: Alignment.centerLeft,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 8.2.w,
      ),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state.orderSummaryModel != null &&
              state.orderSummaryModel!.data != null) {
            final cart = state.orderSummaryModel?.data?.cart;
            final address = state.orderSummaryModel?.data?.address;
            final shippingAmount =
                state.orderSummaryModel?.data?.shippingAmount;
            int? totalAmount = state.orderSummaryModel?.data?.total;
            final subTotalAmount = state.orderSummaryModel?.data?.subTotal;
            if (couponAmount != null) {
              totalAmount = totalAmount! - couponAmount!;
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  address == null
                      ? Center(
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShippingAddressScreen()))
                                    .then((value) {
                                  setState(() {
                                    shopCubit.init(context);
                                  });
                                });
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add Address")),
                        )
                      : Container(
                          height: 19.7.h,
                          // height: getHeight(context)*0.2,
                          // margin:  EdgeInsets.only(left:4.6.w,right:4.6.w,),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp)),
                          ),
                          padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: '${address.name}',
                                    familytype: 2,
                                    linecount: 1,
                                    textcolor: Colors.black,
                                    textsize: 17.sp,
                                    align: Alignment.center,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  EditShippingAddressScreen(
                                                    name: address.name!,
                                                    address: address.address!,
                                                    mobileNo:
                                                        address.mobileNumber!,
                                                    postalCode:
                                                        address.postcode!,
                                                    country: address.country!,
                                                    state: address.state!,
                                                    city: address.city!,
                                                    id: address.id!,
                                                  )));
                                    },
                                    child: CustomText(
                                      text: 'Edit',
                                      familytype: 2,
                                      linecount: 1,
                                      textcolor: getColorFromHex(
                                          ColorConstants.greencolor),
                                      textsize: 17.sp,
                                      align: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                              CustomText(
                                text: '${address.mobileNumber}',
                                familytype: 1,
                                linecount: 1,
                                textcolor:
                                    getColorFromHex(ColorConstants.greycolor)
                                        .withOpacity(0.6),
                                textsize: 15.sp,
                                marginvalue:
                                    const EdgeInsets.only(top: 8, bottom: 4),
                                align: Alignment.centerLeft,
                              ),
                              CustomText(
                                text: '${address.address}',
                                familytype: 1,
                                linecount: 2,
                                textcolor:
                                    getColorFromHex(ColorConstants.greycolor)
                                        .withOpacity(0.6),
                                textsize: 15.sp,
                                // marginvalue: const EdgeInsets.only(top:8,bottom: 8),
                                align: Alignment.centerLeft,
                              ),
                              CustomText(
                                text: '${address.city},${address.state}',
                                familytype: 1,
                                linecount: 1,
                                textcolor:
                                    getColorFromHex(ColorConstants.greycolor)
                                        .withOpacity(0.6),
                                textsize: 15.sp,
                                marginvalue:
                                    const EdgeInsets.only(top: 4, bottom: 4),
                                align: Alignment.centerLeft,
                              ),
                              CustomText(
                                text: '${address.postcode}',
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
                          orderNumber: '${cart?.length}',
                          statusName: '',
                          statusColor:
                              getColorFromHex(ColorConstants.systembluecolor),
                          itemViews: state.orderSummaryModel!.data!.cart !=
                                      null &&
                                  state
                                      .orderSummaryModel!.data!.cart!.isNotEmpty
                              ? Column(
                                  children: state.orderSummaryModel!.data!.cart
                                          ?.map((e) {
                                        return OrderItemView(
                                          e.productImage,
                                          e.productName,
                                          '',
                                          e.discountprice.toString(),
                                          e.quantity.toString(),
                                        );
                                      }).toList() ??
                                      [],
                                )
                              : const SizedBox(),
                          showOrderIcon: false,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: const Divider(
                            height: 1,
                          ),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          contentPadding: EdgeInsets.zero,
                          title: CustomText(
                            text: 'Standard shipping',
                            familytype: 1,
                            linecount: 1,
                            textcolor: Colors.black,
                            marginvalue: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                            textsize: 17.sp,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: CustomText(
                              text:
                                  "Est. delivery by ${DateFormat("MMM dd").format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day + 4,
                              ))} - ${DateFormat("MMM dd").format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day + 6,
                              ))}",
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              marginvalue: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                              textsize: 15.sp,
                            ),
                          ),
                          trailing: CustomText(
                            text: '$shippingAmount.00 ₹',
                            familytype: 1,
                            linecount: 1,
                            textcolor: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.6),
                            marginvalue: EdgeInsets.fromLTRB(0, 0, 4.w, 0),
                            textsize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: const Divider(
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ListTile(
                          onTap: () {
                            CommonUtils.showCustombottomsheetdialog(
                                context,
                                scrollableui(),
                                titleui('Message'),
                                0.6,
                                getColorFromHex(ColorConstants.white)
                                    .withOpacity(0.8));
                          },
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          contentPadding: EdgeInsets.zero,
                          title: CustomText(
                            text: 'Message',
                            familytype: 1,
                            linecount: 1,
                            textcolor: getColorFromHex(ColorConstants.black),
                            marginvalue: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                            textsize: 17.sp,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: 'Optional ',
                                familytype: 1,
                                linecount: 1,
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                                marginvalue:
                                    EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                                textsize: 17.sp,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 4.w),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: theme.textTheme.caption?.color,
                                  size: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 1.h),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Discount ',
                          familytype: 2,
                          linecount: 1,
                          textcolor: getColorFromHex(ColorConstants.black),
                          marginvalue: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                          textsize: 17.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 1.h),
                          child: TextFormField(
                            controller: couponController,
                            readOnly: couponApplied,
                            decoration: InputDecoration(
                                hintText: 'Enter discount code...',
                                hintStyle: TextStyle(fontSize: 17.sp),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.sp))),
                                prefixIcon: Icon(
                                  Icons.local_offer_outlined,
                                  color: Colors.green,
                                  size: 20.sp,
                                ),
                                suffix: GetBuilder<CouponController>(
                                  init: CouponController(),
                                  initState: (_) {},
                                  builder: (controller) {
                                    return InkWell(
                                      onTap: couponApplied
                                          ? null
                                          : () async {
                                              int? amount =
                                                  await controller.getData(
                                                      couponController.text);
                                              if (amount != null) {
                                                FlushBarNotification.showSnack(
                                                  title:
                                                      "Applied Successfully!",
                                                );
                                                setState(() {
                                                  couponApplied = true;
                                                  couponAmount = amount;
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  GetStorage().write(
                                                      "couponCode",
                                                      couponController.text);
                                                });
                                              } else {
                                                FlushBarNotification.showSnack(
                                                  title: "Invalid Coupon!",
                                                );
                                              }
                                            },
                                      child: Text(
                                          couponApplied ? "Applied" : "Apply"),
                                    );
                                  },
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            CommonUtils.showCustombottomsheetdialog(
                                context,
                                PaymentMethodsView(
                                    doc: dec,
                                    shopCubit: shopCubit,
                                    paymentMethod: state.order?.paymentMethod),
                                titleui('Payment method'),
                                0.5,
                                getColorFromHex(ColorConstants.white)
                                    .withOpacity(0.8));
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: theme.textTheme.caption?.color,
                            size: 18.sp,
                          ),
                          title: Text(
                            'Payment method',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: state.order?.paymentMethod == "paytm"
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.sp))),
                                        child: Center(
                                          child: Text(
                                            'Online',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        'Debit card / Credit Card / UPI',
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.sp))),
                                        child: Center(
                                          child: Text(
                                            'COD',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        'Cash on delivery',
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 1.h),
                          child: Divider(
                            thickness: 1,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.36),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(2.w),
                                child: InkWell(
                                  onTap: () async {
                                    var url =
                                        "https://shop.lingerislam.com/index.php/returnpolicy";
                                    if (await canLaunch(url)) {
                                      await launch(url.toString());
                                    } else {
                                      await launch(url.toString());
                                    }
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'By placing an order, you acknowledge that you have read the ',
                                          style:
                                              theme.textTheme.caption?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Terms of Service ',
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'and ',
                                          style:
                                              theme.textTheme.caption?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy ',
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'of Linger Shop. Payment will be processed separately by RazorPay according to ',
                                          style:
                                              theme.textTheme.caption?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'RazorPay Privacy Policy. ',
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Total ',
                                familytype: 2,
                                linecount: 1,
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                                // marginvalue: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                                textsize: 15.sp,
                              ),
                              CustomText(
                                text: '$totalAmount ₹',
                                familytype: 2,
                                linecount: 1,
                                textcolor:
                                    getColorFromHex(ColorConstants.green),
                                // marginvalue: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                                textsize: 18.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (address == null) {
                              FlushBarNotification.showSnack(
                                  title:
                                      "Please add your shipping address first");
                            } else {
                              if (state.order?.paymentMethod == "paytm") {
                                await createOrder(
                                  totalAmount.toString(),
                                  emailId: profileCubit.state.user?.user?.email,
                                  mno: profileCubit.state.user?.user?.mobileNo,
                                  desc: _getPaymentDesc(state),
                                );
                              } else {
                                await shopcubit.createOrder(context,
                                    address:
                                        "${shopcubit.state.myOrderAddress?.data![0].address}",
                                    paymentMethod: "cod",
                                    paymentStatus: "unpaid",
                                    shippingTotal:
                                        "${shopcubit.state.orderSummaryModel?.data?.shippingAmount}",
                                    subTotal:
                                        "${shopcubit.state.orderSummaryModel?.data?.subTotal}",
                                    total:
                                        "${shopcubit.state.orderSummaryModel?.data?.total}",
                                    couponCode: couponApplied
                                        ? couponController.text
                                        : "",
                                    paymentId: "");

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => OrderStatusScreen(
                                //               oid: shopcubit.state.order?.oid ??
                                //                   '',
                                //             )));

                                final router = getItInjector<AppRouter>();
                                AppRouter.getParameters(
                                  params: SuccessScreenParams(
                                    oid: shopcubit.state.order?.oid ?? '',
                                    buttonLabel: 'View Order',
                                    title: 'Order Submitted!',
                                    subTitle: 'Your shipping info:',
                                    subTitleView: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Your shipping info:',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          '(+91) ${shopcubit.state.orderSummaryModel?.data?.address?.mobileNumber}',
                                          style: theme.textTheme.caption,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '${shopcubit.state.orderSummaryModel?.data?.address?.address}',
                                          style: theme.textTheme.caption,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '${shopcubit.state.orderSummaryModel?.data?.address?.city},${shopcubit.state.orderSummaryModel?.data?.address?.state}',
                                          style: theme.textTheme.caption,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      router.pushAndPopUntil(
                                          const OrderStatusScreen(),
                                          predicate: (Route<dynamic> route) {
                                        return false;
                                      });
                                    },
                                  ),
                                  oid: shopcubit.state.order?.oid ?? '',
                                );

                                router.push(const SuccessScreen());
                                router.removeWhere(
                                    (route) => route.name == "OrderSummary");
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(14.sp)),
                            child: Container(
                              constraints: BoxConstraints(minHeight: 5.92.h),
                              alignment: Alignment.center,
                              child: Text(
                                'Place order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget scrollableui() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Enter message for seller',
                      hintStyle: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'Reguler',
                          color: getColorFromHex(ColorConstants.greycolor)
                              .withOpacity(0.6))),
                  onChanged: (tet) {
                    setState(() {
                      if (tet.length <= maxLength) {
                        text = tet;
                      } else {
                        controller.text = text;
                      }
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ]),
              CustomText(
                text: "${text.length}/200",
                familytype: 1,
                linecount: 1,
                marginvalue: const EdgeInsets.only(top: 10),
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 13.sp,
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            title: 'Save',
            onTap: () async {
              final res = await shopCubit.sendMessage(
                context,
                message: controller.text,
              );
              _pop();
            },
          )
        ],
      ),
    );
  }

  void _pop() {
    Navigator.of(context).pop();
  }
}

class PaymentMethodsView extends StatefulWidget with baseclass {
  final Decoration? doc;
  final ShopCubit? shopCubit;
  final String? paymentMethod;
  const PaymentMethodsView(
      {Key? key, required this.doc, this.shopCubit, this.paymentMethod})
      : super(key: key);

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  String? checkedValue;

  @override
  void initState() {
    checkedValue = widget.paymentMethod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              'Saved payment method',
              style: theme.textTheme.caption
                  ?.copyWith(fontFamily: 'SF Pro Display', fontSize: 15.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
            decoration: widget.doc,
            child: Moredetails(
                'paytm.png',
                "Credit / Debit card / UPI",
                () {},
                Radio(
                  value: "paytm",
                  onChanged: (String? value) {
                    setState(() {
                      checkedValue = value!;
                    });
                  },
                  groupValue: checkedValue,
                ),
                true),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              'Other payment method',
              style: theme.textTheme.caption
                  ?.copyWith(fontFamily: 'SF Pro Display', fontSize: 17),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
            decoration: widget.doc,
            child: Moredetails(
                'cod.png',
                "COD",
                () {},
                Radio(
                  value: "cod",
                  onChanged: (String? value) {
                    setState(() {
                      checkedValue = value!;
                    });
                  },
                  groupValue: checkedValue,
                ),
                true),
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
          //   decoration: doc,
          //   child: Moredetails(
          //       'phone.png',
          //       "PhonePe",
          //       () {},
          //       Radio(
          //         value: "cod",
          //         onChanged: (value) {},
          //         groupValue: -1,
          //       ),
          //       true),
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
          //   decoration: doc,
          //   child: Moredetails(
          //       'gpay.png',
          //       "GPay",
          //       () {},
          //       Radio(
          //         value: "cod",
          //         onChanged: (value) {},
          //         groupValue: -1,
          //       ),
          //       true),
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
          //   decoration: doc,
          //   child: Moredetails(
          //       'whatsapp.png',
          //       "Whatsapp",
          //       () {},
          //       Radio(
          //         value: "cod",
          //         onChanged: (value) {},
          //         groupValue: -1,
          //       ),
          //       true),
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
          //   decoration: doc,
          //   child: Moredetails(
          //       'card.png',
          //       "Credit / Debit card",
          //       () {},
          //       Icon(
          //         Icons.arrow_forward_ios,
          //         color: getColorFromHex(ColorConstants.greencolor),
          //         size: 18.sp,
          //       ),
          //       true),
          // ),
          SizedBox(
            height: 4.h,
          ),
          // Expanded(child: Container(),),
          PrimaryButton(
            title: 'Continue',
            onTap: () {
              widget.shopCubit?.changePaymentMethod(context, checkedValue!);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
