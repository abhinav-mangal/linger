import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linger/ui/paymentinfo/managepaymentmethod.dart';
import 'package:linger/ui/paymentinfo/paymentaddnewmethod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../morescreen.dart';

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({Key? key}) : super(key: key);

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> with baseclass {
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _onSearchButtonPressed() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 8.2.h,
        leading: IconButton(
            padding: EdgeInsets.fromLTRB(4.6.w, 0, 0, 0),
            onPressed: _onSearchButtonPressed,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.sp,
            )),
        titleSpacing: 7.3.w,
        title: CustomText(
          text: 'Payment Info',
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          textsize: 20.sp,
          align: Alignment.centerLeft,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 8.2.w,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.fromLTRB(4.6.w, 2.h, 4.6.w, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Saved payment methods',
                familytype: 2,
                linecount: 1,
                textcolor: Colors.black,
                textsize: 18.sp,
                align: Alignment.centerLeft,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                decoration: dec,
                child: Moredetails('mastercard.png', "My Cards", () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ManagePaymentScreen()));
                },
                    Icon(
                      Icons.arrow_forward_ios,
                      color: getColorFromHex(ColorConstants.green),
                      size: 18.sp,
                    ),
                    true),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                decoration: dec,
                child: Moredetails('mastercard.png', "UPI", () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ManageUPIScreen()));
                },
                    Icon(
                      Icons.arrow_forward_ios,
                      color: getColorFromHex(ColorConstants.green),
                      size: 18.sp,
                    ),
                    true),
              ),
              CustomText(
                text: 'Other payment methods',
                familytype: 2,
                linecount: 1,
                textcolor: Colors.black,
                textsize: 18.sp,
                align: Alignment.centerLeft,
              ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
              //   decoration: dec,
              //   child: Moredetails(
              //       'paytm.png',
              //       "PayTM",
              //       () {},
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         color: getColorFromHex(ColorConstants.green),
              //         size: 18.sp,
              //       ),
              //       true),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     vertical: 1.h,
              //   ),
              //   decoration: dec,
              //   child: Moredetails(
              //       'phonepe.png',
              //       "PhonePe",
              //       () {},
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         color: getColorFromHex(ColorConstants.green),
              //         size: 18.sp,
              //       ),
              //       true),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     vertical: 1.h,
              //   ),
              //   decoration: dec,
              //   child: Moredetails(
              //       'gpay.png',
              //       "GooglePay",
              //       () {},
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         color: getColorFromHex(ColorConstants.green),
              //         size: 18.sp,
              //       ),
              //       true),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     vertical: 1.h,
              //   ),
              //   decoration: dec,
              //   child: Moredetails(
              //       'whatsapp.png',
              //       "Whatsapp",
              //       () {},
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         color: getColorFromHex(ColorConstants.green),
              //         size: 18.sp,
              //       ),
              //       true),
              // ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 1.h,
                ),
                decoration: dec,
                child: Moredetails('card.png', "UPI", () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const PaymentAddNewUPI()));
                },
                    Icon(
                      Icons.arrow_forward_ios,
                      color: getColorFromHex(ColorConstants.green),
                      size: 18.sp,
                    ),
                    true),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 1.h,
                ),
                decoration: dec,
                child: Moredetails('card.png', "Add a Credit / Debit card", () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const PaymentAddNewMethodScreen()));
                },
                    Icon(
                      Icons.arrow_forward_ios,
                      color: getColorFromHex(ColorConstants.green),
                      size: 18.sp,
                    ),
                    true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
