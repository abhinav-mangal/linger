import 'package:flutter/material.dart';
import 'package:linger/ui/course/CourseBuyScreen.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
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
        title: const Text(
          'Language',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CourseBuyScreen()));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '₹499.00',
                            style: TextStyle(fontSize: 17, color: Colors.green),
                          ),
                        ],
                      ),
                      const Text(
                        'By name',
                        style: TextStyle(color: Colors.grey),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/users.png',
                              height: 12,
                              width: 18,
                            ),
                            const Text(
                              '1,2K',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 12,
                              width: 18,
                            ),
                            const Text(
                              '4,8',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 199,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ]),
                    ],
                  ),
                ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 02',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 03',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 04',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 05',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 06',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 07',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 08',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 09',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          'Course Name 10',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '₹499.00',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                      ],
                    ),
                    const Text(
                      'By name',
                      style: TextStyle(color: Colors.grey),
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
                        'assets/images/users.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '1,2K',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Image.asset(
                        'assets/images/star.png',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        '4,8',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 199,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
