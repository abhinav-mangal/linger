import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/Dimension.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/ui/course/CourseListScreen.dart';

import '../../Utils/AssetImage.dart';
import '../../Utils/CustomEdits.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> with baseclass {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        backgroundColor: getColorFromHex(ColorConstants.libraryFieldColor),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFd9e6b8),
                Color(0xFFedf0e4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Asslamualaikum',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const Text(
                'Mr. Mujeeb',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Find a course you want to learn',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: Dimension.margin_medium,
                          right: Dimension.margin_medium,
                          top: Dimension.margin_medium),
                      width: getWidth(context),
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Colors.white,
                          elevation: 4.0,
                          child: Container(
                            child: CustomEditText(
                              prefixiconwidget: MyAssetImage(
                                imageName: "ic_search.svg",
                                marginvalue: const EdgeInsets.all(10),
                                icontint: ColorConstants.grey,
                                width: 13.5,
                                height: 13.5,
                              ),
                              hint: "Type Namaz ",
                              hinttextcolor:
                                  getColorFromHex(ColorConstants.grey),
                              familytype: 1,
                              textcolor: getColorFromHex(ColorConstants.grey),
                              textsize: Dimension.text_medium,
                              textalign: TextAlign.left,
                              onchangetext: (value) {},
                              bordercolor: Colors.transparent,
                              borderradius: 0,
                              borderwidth: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Courses',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CourseListScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, top: 0, right: 20, bottom: 40),
                      decoration: BoxDecoration(
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                        border: Border.all(
                          width: 0.5,
                          color:
                              getColorFromHex(ColorConstants.courseFieldColor),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Color(0xFF7F7F7F)),
                              ),
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  'Course name',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/sitting.png',
                            height: 89.45,
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 40),
                    decoration: BoxDecoration(
                      color: getColorFromHex(ColorConstants.courseFieldColor),
                      border: Border.all(
                        width: 0.5,
                        color: getColorFromHex(ColorConstants.courseFieldColor),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Color(0xFF7F7F7F)),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                'Course name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sitting.png',
                          height: 89.45,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
