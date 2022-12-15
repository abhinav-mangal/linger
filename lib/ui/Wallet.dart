import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/cubits/wallet/wallet_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/customText.dart';
import '../data/model/wallet_response_model.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with baseclass {
  bool isPaymentMethodSelected = false;
  String paymentType = '';
  late final WalletCubit walletCubit;

  @override
  void initState() {
    walletCubit = context.read<WalletCubit>()..init();
    super.initState();
    // _getBooks(query);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        WalletResponseBody? walletRes = state.wallet;
        return Scaffold(
          backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: gettoppadding(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        padding: EdgeInsets.only(left: 4.w),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                      ),
                      CustomText(
                        textalign: TextAlign.start,
                        align: Alignment.topLeft,
                        text: "Wallet",
                        familytype: 2,
                        textsize: 20.sp,
                        marginvalue: EdgeInsets.only(
                          left: getW(10),
                        ),
                        textcolor: getColorFromHex(ColorConstants.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 0.7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Amount Received',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: getH(9),
                                  ),
                                  Text(
                                    walletRes != null
                                        ? '₹${walletRes.wallet}'
                                        : "₹",
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.green),
                                  ),
                                ]),
                            Image.asset(
                              'assets/images/bag.png',
                              height: getH(56),
                              width: getH(56),
                            ),
                          ]),
                      SizedBox(
                        height: getH(21),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.only(top: getH(12), bottom: getH(12)),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(60.sp)),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10))),
                                builder: (context) {
                                  bool abc = true;
                                  return SingleChildScrollView(
                                    child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    size: 24,
                                                  ),
                                                ),
                                                const Text('Transfer',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17)),
                                                const SizedBox(
                                                  width: 24,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Visibility(
                                              visible: abc,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter UPI Id ',
                                                      fillColor: getColorFromHex(
                                                          ColorConstants
                                                              .inputFieldColor),
                                                      focusColor: Colors.grey,
                                                      filled: true,
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Container(
                                                    height: 40,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 5,
                                                            bottom: 5),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    // color: Colors.green,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text(
                                                          'Transfer',
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.white,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.white,
                                                          size: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Navigator.of(context).pop();

                                                  showModalBottomSheet(
                                                    context: context,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    builder: (context) {
                                                      return SingleChildScrollView(
                                                          child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              const Text(
                                                                'Phone Number',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                              const TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      "Enter your Mobile Number",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number, // Only numbers can be entered
                                                              ),
                                                              const SizedBox(
                                                                height: 40,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ));
                                                    },
                                                  );
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 7.5,
                                                ),
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 14,
                                                    bottom: 14),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 2,
                                                      blurRadius: 3,
                                                      offset: const Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(children: const [
                                                      Text(
                                                        "UPI",
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ]),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 20,
                                                      color: getColorFromHex(
                                                          ColorConstants.green),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  paymentType = 'Card';
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 7.5,
                                                ),
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 14,
                                                    bottom: 14),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 2,
                                                      blurRadius: 3,
                                                      offset: const Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(children: const [
                                                      Text(
                                                        "Transfer to your bank account",
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ]),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 20,
                                                      color: getColorFromHex(
                                                          ColorConstants.green),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Visibility(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Enter amount",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                SizedBox(
                                                  height: 50,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                      fillColor: getColorFromHex(
                                                          ColorConstants
                                                              .inputFieldColor),
                                                      focusColor: Colors.grey,
                                                      filled: true,
                                                      hintText: 'Enter amount',
                                                    ),
                                                    keyboardType: TextInputType
                                                        .number, // Only numbers can be entered
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                const Text(
                                                  "Account number",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                SizedBox(
                                                  height: 50,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                      hintText:
                                                          'Enter your account number',
                                                      fillColor: getColorFromHex(
                                                          ColorConstants
                                                              .inputFieldColor),
                                                      focusColor: Colors.grey,
                                                      filled: true,
                                                    ),
                                                    keyboardType: TextInputType
                                                        .number, // Only numbers can be entered
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                const Text(
                                                  "IFSC",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                SizedBox(
                                                  height: 45,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                      hintText: 'Enter IFSC',
                                                      fillColor: getColorFromHex(
                                                          ColorConstants
                                                              .inputFieldColor),
                                                      focusColor: Colors.grey,
                                                      filled: true,
                                                    ),
                                                    keyboardType: TextInputType
                                                        .number, // Only numbers can be entered
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Container(
                                                  height: 40,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          top: 5,
                                                          bottom: 5),
                                                  margin:
                                                      const EdgeInsets.all(20),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                  ),
                                                  // color: Colors.green,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                        'Transfer',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.white,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                        size: 16,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                          ],
                                        )),
                                  );
                                });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Transfer',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 4.w, right: 4.w, bottom: getH(24)),
                  padding: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: getH(16), bottom: getH(16)),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 0.7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ]),
                      SizedBox(
                        height: getH(486),
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                10, (index) => const transactiondata()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class transactiondata extends StatelessWidget with baseclass {
  const transactiondata({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getH(12), bottom: getH(12), right: getW(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircleAvatar(
              radius: getH(20),
              backgroundImage: const ExactAssetImage(
                'assets/images/received.png',
              ),
            ),
            SizedBox(
              width: getW(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Received from',
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                    ),
                    Text(
                      ' User',
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  '19 apr',
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
              ],
            ),
          ]),
          Text(
            '₹18',
            style: TextStyle(
                color: Colors.green,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
