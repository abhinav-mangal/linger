import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';

class ReferEarnDetailScreen extends StatefulWidget {
  const ReferEarnDetailScreen({Key? key}) : super(key: key);

  @override
  State<ReferEarnDetailScreen> createState() => _ReferEarnDetailScreenState();
}

class _ReferEarnDetailScreenState extends State<ReferEarnDetailScreen>
    with SingleTickerProviderStateMixin, baseclass {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

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
          'Details',
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
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
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
                children: [
                  TabBar(
                    labelColor: getColorFromHex(ColorConstants.green),
                    indicatorColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    controller: _controller,
                    tabs: const [
                      Tab(
                        text: 'Received',
                      ),
                      Tab(
                        text: 'Pending',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400.0,
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        SizedBox(
                            height: 400,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: ExactAssetImage(
                                                'assets/images/m.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Mujeeb',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '19 apr',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      const Text(
                                        '₹18',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            )),
                        SizedBox(
                          height: 400,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 50,
                                          backgroundImage: ExactAssetImage(
                                              'assets/images/m.png'),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Mujeeb',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '19 apr',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Text(
                                      '₹18',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
