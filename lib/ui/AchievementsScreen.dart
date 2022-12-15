import 'package:flutter/material.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            'Achievements',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Stack(children: [
          Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/superhero.png',
                                height: 30.0,
                                width: 30.0,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Weekend Hero",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/stars.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Day dreamer",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/trophy.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Season Legend",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/podium.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Over Achiever",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/muslim.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Me Arabian",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/woman.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Miss manners",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/book.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Reading Rockstar",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/student.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Student of the year",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/wow.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "The Wow!",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/goal.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "The extra Miles",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/friends.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Good Friend",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/love.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Caring classroom",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/feather.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Aspiring Author",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/jackpot.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Five star honour",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/graduation.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Kind classmate",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/fire.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Peak performance",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/wreath.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Super speller",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/images/praying.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Perform maulvi",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              )),
        ])));
  }
}
