import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';

class ProfileFollowingScreen extends StatefulWidget {
  const ProfileFollowingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileFollowingScreen> createState() => _ProfileFollowingScreenState();
}

class _ProfileFollowingScreenState extends State<ProfileFollowingScreen>
    with baseclass {
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
          'Muhammad M',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.width - 150,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/probanners.png',
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      left: size.width / 2 - 62,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              ExactAssetImage('assets/images/m.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Muhammad M',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(5),
              //   margin: const EdgeInsets.only(left: 110, right: 110, top: 10, bottom: 10),
              //   decoration: BoxDecoration(
              //     color: ColorConstants.verifyFieldColor,
              //     border: Border.all(width: 1, color: ColorConstants.verifyFieldColor),
              //     borderRadius: const BorderRadius.all(Radius.circular(20,),),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         'assets/images/verify.png',
              //         height: 20,
              //         width: 20,
              //       ),
              //       const Text('Premium Account', style: TextStyle(color: ColorConstants.textverifyFieldColor),),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          '24',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Likes',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '1M',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '10',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 10),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: getColorFromHex(ColorConstants.green),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(width: 1, color: Colors.green),
                      ),
                      child: const Text(
                        'Following',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 10),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: getColorFromHex(ColorConstants.likeButton),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Image.asset(
                        'assets/images/redheart.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: getColorFromHex(
                            ColorConstants.greyBackgroundScreen),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Image.asset(
                        'assets/images/f.png',
                        width: 18.75,
                        height: 18.75,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: getColorFromHex(
                            ColorConstants.greyBackgroundScreen),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Image.asset(
                        'assets/images/i.png',
                        width: 18.75,
                        height: 18.75,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: getColorFromHex(
                            ColorConstants.greyBackgroundScreen),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Image.asset(
                        'assets/images/t.png',
                        width: 18.75,
                        height: 18.75,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: getColorFromHex(
                            ColorConstants.greyBackgroundScreen),
                        width: 1)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Activity',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 3, bottom: 3),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: getColorFromHex(
                                  ColorConstants.greyBackgroundScreen),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: const Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/greycheck.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const Text(
                              'Completed Surah Rahman',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/greycheck.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Passed the Quiz',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/greycheck.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Started a new Course',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Show all',
                            style: TextStyle(color: Colors.green),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       ExpandableTheme(
              //         data: const ExpandableThemeData(
              //           iconColor: Colors.blue,
              //           useInkWell: true,
              //         ),
              //         child: ListView(
              //           physics: const BouncingScrollPhysics(),
              //           children: <Widget>[
              //             Card1(),
              //             Card2(),
              //             Card3(),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color:
                          getColorFromHex(ColorConstants.greyBackgroundScreen)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Achievements',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 12,
                              bottom: 12,
                            ),
                            margin: const EdgeInsets.all(5),
                            color: getColorFromHex(
                                ColorConstants.greyBackgroundScreen),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/flag.png',
                                  height: 48,
                                  width: 48,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Achiever',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 12,
                              bottom: 12,
                            ),
                            margin: const EdgeInsets.all(5),
                            color: getColorFromHex(
                                ColorConstants.greyBackgroundScreen),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/badge.png',
                                  height: 48,
                                  width: 48,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Glorious',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 12,
                              bottom: 12,
                            ),
                            margin: const EdgeInsets.all(5),
                            color: getColorFromHex(
                                ColorConstants.greyBackgroundScreen),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/medal.png',
                                  height: 48,
                                  width: 48,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Collector',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
