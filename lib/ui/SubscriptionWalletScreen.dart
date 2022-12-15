import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/SubscriptionCardScreen.dart';

class SubscriptionWalletScreen extends StatefulWidget {
  const SubscriptionWalletScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionWalletScreen> createState() =>
      _SubscriptionWalletScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _SubscriptionWalletScreenState extends State<SubscriptionWalletScreen>
    with baseclass {
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool isPaymentMethodSelected = false;
  String paymentType = '';

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: getColorFromHex(
                        ColorConstants.buttonBackgroundColorsGray),
                    border: Border.all(
                        color: getColorFromHex(
                            ColorConstants.buttonBackgroundColorsGray)),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Wallet Balance'),
                      Text(
                        '₹50',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Amount Payable:',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '₹99',
                          style: TextStyle(
                              color: getColorFromHex(ColorConstants.green),
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Row(children: [
                        Radio<SingingCharacter>(
                          value: SingingCharacter.jefferson,
                          activeColor: getColorFromHex(ColorConstants.green),
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        const Text(
                          'Include wallet balance',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10))),
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      const Text('Payment Method'),
                                      const SizedBox(
                                        width: 24,
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Payment Method',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isPaymentMethodSelected = true;
                                        paymentType = 'PayTM(***202)';
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.symmetric(
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
                                              width: 1, color: Colors.white),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: const Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              Image.asset(
                                                'assets/images/paytm.png',
                                                height: 20.0,
                                                width: 20.0,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "PayTM",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ]),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                              color: getColorFromHex(
                                                  ColorConstants.green),
                                            )
                                          ],
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isPaymentMethodSelected = true;
                                        paymentType = 'PhonePe(***202)';
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
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
                                            width: 1, color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Image.asset(
                                              'assets/images/phonepe.png',
                                              height: 20.0,
                                              width: 20.0,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "PhonePe",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400),
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
                                        isPaymentMethodSelected = true;
                                        paymentType = 'GooglePay(***202)';
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
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
                                            width: 1, color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Image.asset(
                                              'assets/images/gpay.png',
                                              height: 20.0,
                                              width: 20.0,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "GooglePay",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400),
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
                                        isPaymentMethodSelected = true;
                                        paymentType = 'WhatsApp(***202)';
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
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
                                            width: 1, color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Image.asset(
                                              'assets/images/whatsapp.png',
                                              height: 20.0,
                                              width: 20.0,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "WhatsApp",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400),
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
                                        isPaymentMethodSelected = true;
                                        paymentType = 'VisaCard(***654)';
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
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
                                            width: 1, color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Image.asset(
                                              'assets/images/card.png',
                                              height: 20.0,
                                              width: 20.0,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "Credit / Debit card",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400),
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
                                    height: 30,
                                  ),
                                ],
                              )),
                        );
                      });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: isPaymentMethodSelected
                    ? Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: getColorFromHex(ColorConstants.green)),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Wallet Balance'),
                                Text(
                                  paymentType,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const Text(
                              'Change',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 50,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: getColorFromHex(ColorConstants.green),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Select Payment Methods',
                              style: TextStyle(color: Colors.green),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SubscriptionCardScreen()));
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: getColorFromHex(ColorConstants.green),
                border: Border.all(
                    color: getColorFromHex(ColorConstants.green), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Pay Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
