import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class CreditCardsPage extends StatelessWidget with baseclass {
  final String name;
  final String accountNumber;

  CreditCardsPage({Key? key, required this.name, required this.accountNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCreditCard(
              startcolor: getColorFromHex(ColorConstants.lightpurplecolor),
              endcolor: getColorFromHex(ColorConstants.purplecolor),
              cardExpiration: "08/2022",
              cardHolder: "Card Holder Name",
              cardNumber: "XXXX XXXX XXXX XXXX"),
        ],
      ),
    );
  }

  Widget _buildCreditCard(
      {@required Color? startcolor,
      @required Color? endcolor,
      @required String? cardNumber,
      @required String? cardHolder,
      @required String? cardExpiration}) {
    return Container(
      height: 22.27.h,
      padding:
          EdgeInsets.only(left: 4.w, right: 5.1.w, bottom: 2.36.h, top: 2.36.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.sp)),
        gradient: LinearGradient(
            colors: [
              startcolor!,
              endcolor!,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLogosBlock(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CustomText(
                text: "***${accountNumber.substring(accountNumber.length - 3)}",
                familytype: 2,
                textsize: 18.sp,
                textcolor: getColorFromHex(ColorConstants.white),
                // marginvalue: EdgeInsets.only(top:0.94.h),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/mastercard.png",
          height: 5.2.h,
          width: 5.2.h,
        ),
        SizedBox(
          width: 3.w,
        ),
        _buildDetailsBlock(
          label:
              'Mastercard(***${accountNumber.substring(accountNumber.length - 3)})',
          value: name,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock(
      {@required String? label, @required String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          text: "$label",
          familytype: 1,
          textsize: 15.sp,
          textcolor: getColorFromHex(ColorConstants.white),
          // marginvalue: EdgeInsets.only(top:0.94.h),
        ),
        CustomText(
          text: "$value",
          familytype: 1,
          textsize: 13.sp,
          textcolor:
              getColorFromHex(ColorConstants.inactiveColor).withOpacity(0.6),
          // marginvalue: EdgeInsets.only(top:0.94.h),
        ),
      ],
    );
  }
}
