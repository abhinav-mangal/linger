import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/paymentinfo/paymentmethods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/CommonUtils.dart';
import '../../Utils/CustomEdits.dart';
import '../../Utils/cardmonthformatter.dart';
import '../../Utils/cardnumberformatter.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class PaymentAddNewMethodScreen extends StatefulWidget {
  const PaymentAddNewMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentAddNewMethodScreen> createState() =>
      _PaymentAddNewMethodScreenState();
}

class _PaymentAddNewMethodScreenState extends State<PaymentAddNewMethodScreen>
    with baseclass {
  late final TextEditingController _creditnumbercontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditmonthcontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditcvvcontroller =
      TextEditingController(text: '');
  late final TextEditingController _creditholdernamecontroller =
      TextEditingController(text: '');
  var separator = " ";
  final formGlobalKey = GlobalKey<FormState>();
  late final ShopCubit shopCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopCubit = context.read<ShopCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _onSearchButtonPressed() {
      Navigator.pop(context);
    }

    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
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
            text: 'Payment Method',
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
          child: Form(
            key: formGlobalKey,
            child: Container(
              margin: EdgeInsets.fromLTRB(4.6.w, 2.h, 4.6.w, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Debit or credit card',
                    familytype: 2,
                    linecount: 1,
                    textcolor: Colors.black,
                    textsize: 18.sp,
                    align: Alignment.centerLeft,
                  ),
                  CustomText(
                    text: 'Card number',
                    familytype: 1,
                    linecount: 1,
                    textcolor: Colors.black,
                    marginvalue: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    textsize: 15.sp,
                    align: Alignment.centerLeft,
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      textcontroller: _creditnumbercontroller,
                      hint: "1234 7652 2192 123",
                      hinttextsize: 15.sp,
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.grey),
                      textsize: 15.sp,
                      texttype: TextInputType.number,
                      textalign: TextAlign.left,
                      onchangetext: (value) {
                        if (value.isEmpty) {}
                      },
                      validatemethod: (value) {
                        if (value.isEmpty || value == '') {
                          return "Field is empty";
                        }
                      },
                      bordercolor: Colors.transparent,
                      borderradius: 0,
                      borderwidth: 0,
                      inputform: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                            16 + separator.length * 4),
                        CardFormatter(separator: separator),
                      ],
                    ),
                  ),
                  CustomText(
                    text: 'Expiration date',
                    familytype: 1,
                    linecount: 1,
                    textcolor: Colors.black,
                    marginvalue: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    textsize: 15.sp,
                    align: Alignment.centerLeft,
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      textcontroller: _creditmonthcontroller,
                      hint: "MM/YY",
                      hinttextsize: 15.sp,
                      texttype: TextInputType.number,
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.grey),
                      textsize: 15.sp,
                      textalign: TextAlign.left,
                      onchangetext: (value) {
                        if (value.isEmpty) {}
                      },
                      validatemethod: (value) {
                        if (value.isEmpty || value == '') {
                          return "Field is empty";
                        }
                      },
                      bordercolor: Colors.transparent,
                      borderradius: 0,
                      borderwidth: 0,
                      inputform: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardMonthInputFormatter()
                      ],
                    ),
                  ),
                  CustomText(
                    text: 'Security code',
                    familytype: 1,
                    linecount: 1,
                    textcolor: Colors.black,
                    marginvalue: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    textsize: 15.sp,
                    align: Alignment.centerLeft,
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      textcontroller: _creditcvvcontroller,
                      hint: "CVV/CVC",
                      validatemethod: (value) {
                        if (value.isEmpty) {
                          return "CVV/CVC is Required";
                        }

                        if (value.length < 3 || value.length > 4) {
                          return "CVV is invalid";
                        }
                      },
                      hinttextsize: 15.sp,
                      texttype: TextInputType.number,
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.grey),
                      textsize: 15.sp,
                      textalign: TextAlign.left,
                      onchangetext: (value) {
                        if (value.isEmpty) {}
                      },
                      bordercolor: Colors.transparent,
                      borderradius: 0,
                      borderwidth: 0,
                      inputform: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ),
                  CustomText(
                    text: 'Cardholder name',
                    familytype: 1,
                    linecount: 1,
                    textcolor: Colors.black,
                    marginvalue: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    textsize: 15.sp,
                    align: Alignment.centerLeft,
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      textcontroller: _creditholdernamecontroller,
                      hint: "Cardholder name",
                      validatemethod: (value) {
                        if (value.isEmpty || value == '') {
                          return "Field is empty";
                        }
                      },
                      hinttextsize: 15.sp,
                      texttype: TextInputType.text,
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.grey),
                      textsize: 15.sp,
                      textalign: TextAlign.left,
                      onchangetext: (value) {
                        if (value.isEmpty) {}
                      },
                      bordercolor: Colors.transparent,
                      borderradius: 0,
                      borderwidth: 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.lock_outlined,
                            size: 16.sp,
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'We follow the Payment Card Industry Data Security Standard (PCI DSS) and use industry-standard encryption to protect the confidentiality of your personal information.',
                                  style: theme.textTheme.caption?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Payment will be processed separately by PIPO according to the ',
                                    style: theme.textTheme.caption?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'PIPO Privacy Policy',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (formGlobalKey.currentState!.validate()) {
              shopCubit.addPaymentMethod(
                context,
                cardNumber: _creditnumbercontroller.text,
                cvc: _creditcvvcontroller.text,
                expirationMonth: _creditmonthcontroller.text.split('/')[0],
                expirationYear: _creditmonthcontroller.text.split('/')[1],
                name: _creditholdernamecontroller.text,
              );
              Navigator.of(context).pop();
            }

            // Navigator.push(
            //     context,
            //     CupertinoPageRoute(
            //         builder: (context) => const PaymentMethodScreen()));
          },
          child: Container(
            width: 100.w,
            height: 6.39.h,
            margin: EdgeInsets.fromLTRB(4.6.w, 4.7.h, 4.6.w, 4.7.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: getColorFromHex(ColorConstants.green),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                  fontSize: 17.sp, color: Colors.white, fontFamily: 'SemiBold'),
            ),
          ),
        ),
      );
    });
  }
}

class PaymentAddNewUPI extends StatefulWidget {
  const PaymentAddNewUPI({Key? key}) : super(key: key);

  @override
  State<PaymentAddNewUPI> createState() => _PaymentAddNewUPIState();
}

class _PaymentAddNewUPIState extends State<PaymentAddNewUPI> with baseclass {
  late final TextEditingController _upiEditingController =
      TextEditingController(text: '');

  var separator = " ";
  late final ShopCubit shopCubit;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopCubit = context.read<ShopCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _onSearchButtonPressed() {
      Navigator.pop(context);
    }

    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
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
            text: 'Payment Method',
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
          child: Form(
            key: formGlobalKey,
            child: Container(
              margin: EdgeInsets.fromLTRB(4.6.w, 2.h, 4.6.w, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Add UPI',
                    familytype: 2,
                    linecount: 1,
                    textcolor: Colors.black,
                    textsize: 18.sp,
                    align: Alignment.centerLeft,
                  ),
                  Container(
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: getColorFromHex(ColorConstants.greycolor)
                                .withOpacity(0.25)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomEditText(
                      textcontroller: _upiEditingController,
                      hint: "Enter UPI ID",
                      validatemethod: (value) {
                        if (value.isEmpty || value == '') {
                          return "Field is empty";
                        }
                      },
                      hinttextsize: 15.sp,
                      texttype: TextInputType.text,
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.grey),
                      textsize: 15.sp,
                      textalign: TextAlign.left,
                      onchangetext: (value) {
                        if (value.isEmpty) {}
                      },
                      bordercolor: Colors.transparent,
                      borderradius: 0,
                      borderwidth: 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Payment will be processed separately by PIPO according to the ',
                                    style: theme.textTheme.caption?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'PIPO Privacy Policy',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (formGlobalKey.currentState!.validate()) {
              shopCubit.addPaymentMethod(context,
                  upi: _upiEditingController.text);
              Navigator.of(context).pop();
            }
          },
          child: Container(
            width: 100.w,
            height: 6.39.h,
            margin: EdgeInsets.fromLTRB(4.6.w, 4.7.h, 4.6.w, 4.7.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: getColorFromHex(ColorConstants.green),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                  fontSize: 17.sp, color: Colors.white, fontFamily: 'SemiBold'),
            ),
          ),
        ),
      );
    });
  }
}
