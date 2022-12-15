import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/SubscriptionWalletScreen.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with baseclass {
  String rs = '₹';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Subscription',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 40,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color:
                      getColorFromHex(ColorConstants.buttonBackgroundColorsGray)
                          .withOpacity(0.08),
                  border: Border.all(
                      color: getColorFromHex(
                              ColorConstants.buttonBackgroundColorsGray)
                          .withOpacity(0.08)),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Linger Free'),
                    Text(
                      'CURRENT PLAN',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: getColorFromHex(ColorConstants.green), width: 1)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/crown.png',
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Premium',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              '₹199',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '₹99',
                              style: TextStyle(
                                  color: getColorFromHex(ColorConstants.green),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.6,
                          child: const Text('Weekly & Season prices'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Text('All library access'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Text('30% off on all courses'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.7,
                          child: const Text(
                              'Premium badge and frame all cover photos access.'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Text('Get your baby name of date'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Text('Sukun section absolutely free.'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                          'Free',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.6,
                          child: const Text(
                            'Daily Prices',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              'One book access',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/checkbox.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              'No discount',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SubscriptionWalletScreen()));
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 40,
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
                  'GET PREMIUM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
