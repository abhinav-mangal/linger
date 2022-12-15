import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';

class CourseBuyScreen extends StatefulWidget {
  const CourseBuyScreen({Key? key}) : super(key: key);

  @override
  State<CourseBuyScreen> createState() => _CourseBuyScreenState();
}

class _CourseBuyScreenState extends State<CourseBuyScreen>
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
      resizeToAvoidBottomInset: false,
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
          'Language',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: getColorFromHex(ColorConstants.libraryFieldColor),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: getColorFromHex(ColorConstants.libraryFieldColor),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Course Name 01',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '₹499.00',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  const Text(
                    'By name',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Image.asset(
                      'assets/images/usersb.png',
                      height: 12,
                      width: 18,
                    ),
                    const Text(
                      '1,2K',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    Image.asset(
                      'assets/images/starb.png',
                      height: 12,
                      width: 18,
                    ),
                    const Text(
                      '4,8',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ]),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Buy Now',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
                right: 20,
              ),
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                        text: 'Course Detail',
                      ),
                      Tab(
                        text: 'Course Content',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 400.0,
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        SizedBox(
                          height: 400,
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: size.width,
                                      height: size.width - 196,
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/frame.png',
                                            fit: BoxFit.fill,
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
                              SizedBox(
                                child: Container(
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
                                        spreadRadius: 0.7,
                                        blurRadius: 0.7,
                                        offset: const Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'About the Course',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet, '
                                          'consectetur adipiscing elit. '
                                          'At imperdiet et pellentesque euismod. '
                                          'Nunc sed risus sed cursus nunc vel posuere. '
                                          'Et suspendisse at et, scelerisque risus, '
                                          'amet tincidunt pretium condimentum. '
                                          'Ultricies neque tristique purus posuere '
                                          'venenatis mattis leo imperdiet.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                            height: 1.8,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: Container(
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
                                        spreadRadius: 0.7,
                                        blurRadius: 0.7,
                                        offset: const Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text(
                                            'About the Tutor',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Row(children: [
                                          Container(
                                            width: 70,
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
                                                'Tutor Details',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    height: 2.0),
                                              ),
                                            ],
                                          ),
                                        ]),
                                        const Text(
                                          'Lorem ipsum dolor sit amet, '
                                          'consectetur adipiscing elit. '
                                          'At imperdiet et pellentesque euismod. '
                                          'Nunc sed risus sed cursus nunc vel posuere. '
                                          'Et suspendisse at et, scelerisque risus, '
                                          'amet tincidunt pretium condimentum. '
                                          'Ultricies neque tristique purus posuere '
                                          'venenatis mattis leo imperdiet.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                            height: 1.8,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                        ),
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
                                      const Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 1',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '2',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 2',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '3',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 3',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '4',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 4',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '5',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 5',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '6',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 6',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '7',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 7',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '8',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 8',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '10',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 10',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Text(
                                        '11',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Course Title 11',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '05:00 min',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.green,
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
