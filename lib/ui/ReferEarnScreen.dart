import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/ReferEarnDetailScreen.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({Key? key}) : super(key: key);

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> with baseclass {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        title: const Text(
          'Refer & Earn',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: getColorFromHex(ColorConstants.greyBackgroundScreen),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                          children: const [
                            Text(
                              'Total Amount Received',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '₹1000',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.green),
                            ),
                          ]),
                      Image.asset(
                        'assets/images/bag.png',
                        height: 56.0,
                        width: 56.0,
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ReferEarnDetailScreen()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 20,),
          Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Share to your friends to earn',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Facebook'),
                        ]),
                        Column(children: [
                          Image.asset(
                            'assets/images/whats.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('WhatsApp'),
                        ]),
                        Column(children: [
                          Image.asset(
                            'assets/images/instagram.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Instagram'),
                        ]),
                        Column(children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: getColorFromHex(
                                    ColorConstants.greyBackgroundScreen),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Image.asset(
                                'assets/images/dots.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                            ),
                          ),
                          const Text('More')
                        ])
                      ],
                    ),
                  ])),
        ],
      ),
    );
  }
}
