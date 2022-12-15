import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';

class SubscriptionGpayScreen extends StatefulWidget {
  const SubscriptionGpayScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionGpayScreen> createState() => _SubscriptionGpayScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _SubscriptionGpayScreenState extends State<SubscriptionGpayScreen>
    with baseclass {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
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
                color:
                    getColorFromHex(ColorConstants.buttonBackgroundColorsGray),
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
          Container(
            height: 40,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: getColorFromHex(ColorConstants.green)),
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Wallet Balance'),
                Text(
                  'Mastercard(***113)',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Change',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 300,
          ),
          InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SubscriptionGpayScreen()));
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
