import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Utils/flushbar_notification.dart';
//import 'package:razorpay_web/razorpay_flutter_web.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:linger/Utils/logger_utils.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/my_order_address/my_order_address.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../../common_screen/success_screen.dart';
import '../../constants/razorpay.dart';
import '../../data/model/my_order/morder.dart';
import '../../models/razorpay_service.dart';
import '../orders/order_status_screen.dart';

mixin PaymentMixin<T extends StatefulWidget> on State<T> {
  Razorpay? _razorpay;
  late final ShopCubit shopcubit;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    shopcubit = context.read<ShopCubit>();
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final theme = Theme.of(context);
    if (response.paymentId == null || response.orderId == null) {
      FlushBarNotification.showSnack(
        title: "Payment failed!",
      );
      return;
    } else {
      FlushBarNotification.showSnack(
        title: "Payment Successfully!",
      );

      await shopcubit.createOrder(
        context,
        address: "${shopcubit.state.myOrderAddress?.data![0].address}",
        paymentMethod: "upi",
        paymentStatus: "paid",
        shippingTotal:
            "${shopcubit.state.orderSummaryModel?.data?.shippingAmount}",
        subTotal: "${shopcubit.state.orderSummaryModel?.data?.subTotal}",
        total: "${shopcubit.state.orderSummaryModel?.data?.total}",
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  OrderStatusScreen(oid: shopcubit.state.order?.oid ?? '')));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => SuccessScreen(
      //                 params: SuccessScreenParams(
      //               // oid: shopcubit.state.order?.oid ?? '',
      //               buttonLabel: 'View Order',
      //               title: 'Order Submitted!',
      //               subTitle: 'Your shipping info:',
      //               subTitleView: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'Your shipping info:',
      //                     style: theme.textTheme.titleMedium,
      //                   ),
      //                   const SizedBox(
      //                     height: 16,
      //                   ),
      //                   Text(
      //                     '(+91) ${shopcubit.state.orderSummaryModel?.data?.address?.mobileNumber}',
      //                     style: theme.textTheme.caption,
      //                   ),
      //                   const SizedBox(
      //                     height: 8,
      //                   ),
      //                   Text(
      //                     '${shopcubit.state.orderSummaryModel?.data?.address?.address}',
      //                     style: theme.textTheme.caption,
      //                   ),
      //                   const SizedBox(
      //                     height: 8,
      //                   ),
      //                   Text(
      //                     '${shopcubit.state.orderSummaryModel?.data?.address?.city},${shopcubit.state.orderSummaryModel?.data?.address?.state}',
      //                     style: theme.textTheme.caption,
      //                   ),
      //                 ],
      //               ),
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (_) => OrderStatusScreen(
      //                               oid: shopcubit.state.order?.oid ?? '',
      //                             )));
      //               },
      //             ))));
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (response.code == Razorpay.PAYMENT_CANCELLED) {
      FlushBarNotification.showSnack(
        title: "Payment process cancelled!",
      );
    } else {
      FlushBarNotification.showSnack(
        title: "Payment failed due to ${response.message}",
      );
    }
    AppLogger.e('Payment error - ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    FlushBarNotification.showSnack(
      title: "Payment Successfully!",
    );
  }

  Future<dynamic> createOrder(String amount,
      {String? emailId, String? mno, String? desc}) async {
    var mapHeader = <String, String>{};
    mapHeader['Authorization'] =
        "Basic cnpwX3Rlc3RfU2RHQmFoV3RsS1dNd2I6Mlh2WElOSDlMcG9xTHdyU3F5cDFzam5y";
    mapHeader['Accept'] = "application/json";
    mapHeader['Content-Type'] = "application/x-www-form-urlencoded";
    var map = <String, String>{};
    setState(() {
      map['amount'] = "${(num.parse(amount))}";
    });
    map['currency'] = "INR";
    map['receipt'] = "receipt1";
    var response = await http.post(
      Uri.https("api.razorpay.com", "/v1/orders"),
      headers: mapHeader,
      body: map,
    );
    if (response.statusCode == 200) {
      RazorpayOrderResponse data =
          RazorpayOrderResponse.fromJson(json.decode(response.body));
      openCheckout(data, amount, email: emailId, mno: mno, desc: desc);
    } else {
      FlushBarNotification.showSnack(
        title: "Something went wrong!",
      );
    }
  }

  void openCheckout(RazorpayOrderResponse data, String amount,
      {String? mno, String? email, String? desc}) async {
    var options = {
      'key': RazorpayApiKey,
      'amount': "${(num.parse(amount) * 100)}",
      'name': 'Linger',
      'description': desc ?? 'Pay for product purchase',
      // 'order_id': '${data.id}',
      'prefill': {
        'contact': '$mno',
        'email': '$email',
      }
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
