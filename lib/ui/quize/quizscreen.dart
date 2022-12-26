import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Controller/profile_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with baseclass {
  List<UserPoints> userpointdetail = [];
  String img =
      "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000&t=st=1662301789~exp=1662302389~hmac=50894fbaedda9f0899b5cc1d44f745c401744f6af744edf3c153b6b973407605";
  String img1 =
      "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=2000&t=st=1662301801~exp=1662302401~hmac=f9f405e754f1a5e9dacb772513b78aa85a5297fb2c3f6be97f02553c723b8c0a";

  @override
  void initState() {
    super.initState();
    userpointdetail = [
      UserPoints(
        points: 200,
        userid: 1,
        username: "The All Safe",
        imageurl: img,
      ),
      UserPoints(
        points: 150,
        userid: 2,
        username: "Mohd Salman",
        imageurl: img1,
      ),
      UserPoints(
        points: 100,
        userid: 3,
        username: "Tung Tran",
        imageurl: img,
      ),
      UserPoints(
        points: 95,
        userid: 4,
        username: "Darrell Steward",
        imageurl: img1,
      ),
      UserPoints(
        points: 95,
        userid: 5,
        username: "Jerome Bell",
        imageurl: img,
      ),
      UserPoints(
        points: 95,
        userid: 6,
        username: "Kathryn Murphy",
        imageurl: img1,
      ),
      UserPoints(
        points: 95,
        userid: 7,
        username: "Devon Lane",
        imageurl: img,
      ),
      UserPoints(
        points: 95,
        userid: 8,
        username: "Kristin Watson",
        imageurl: img1,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/game_screen.png"))),
          ),
          GetBuilder<ProfileController>(
            init: ProfileController(),
            initState: (_) {},
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 50),
                    child: GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              alignment: Alignment.topCenter,
                              insetPadding: const EdgeInsets.only(
                                  left: 40, right: 40, top: 120, bottom: 320),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/quiz_frame_03.png'),
                                    const SizedBox(height: 20),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        "Ramazan-Month of Maghfirat",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        "This Quiz season will be for 50 days at the end of the seasons it will bring the rewards worth of lacks, So be prepared",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    FloatingActionButton.extended(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        backgroundColor:
                                            const Color(0xFF07DAFE),
                                        elevation: 0,
                                        label: const Text('Close')),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                const Positioned(
                                    top: 100,
                                    left: 20,
                                    child: Text(
                                      "22/02/2023",
                                      style: TextStyle(
                                          // fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                const Positioned(
                                    top: 100,
                                    left: 220,
                                    child: Text(
                                      "12 : 00 AM",
                                      style: TextStyle(
                                          // fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                              ]),
                            );
                          }),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Season-1",
                                style: TextStyle(color: Colors.grey),
                              ),
                              RotatedBox(
                                quarterTurns: 75,
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "Ramazan-Month of Maghfirat",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.lock_outline,
                                  color: Colors.white, size: 12),
                              CountdownTimer(
                                endTime: DateTime(2023, 2, 22)
                                    .millisecondsSinceEpoch,
                                endWidget: const Center(
                                    child: Text('The current time has expired',
                                        style: TextStyle(color: Colors.white))),
                                textStyle: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 25,
                      foregroundImage: CachedNetworkImageProvider(
                          controller.profileData!.user!.image ?? ""),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Assalamualaikum",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    controller.profileData!.user!.name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: size.height / 4.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF7A98F2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DottedBorder(
                            dashPattern: const [6, 3, 0, 3],
                            strokeWidth: 2,
                            color: Colors.white,
                            child: Container(
                              color: Colors.white.withOpacity(0.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Take First Step",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Check below to start your\n first task.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24.0, top: 12, bottom: 12),
                    child: Row(
                      children: const [
                        Text(
                          "Take a Quiz",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/quiz_frame_01.png'),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24.0, top: 12, bottom: 12),
                    child: Row(
                      children: const [
                        Text(
                          "Take a Challange",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/quiz_frame_02.png'),
                  const SizedBox(height: 100)
                ],
              );
            },
          ),
          // Positioned(
          //   top: size.height / 1.9,
          //   left: size.width / 2.5,
          //   child: Image.asset('assets/images/quiz_arrow_down.png'),
          // ),
        ],
      ),
    ));
  }
}

class UserPoints {
  final String imageurl;
  final int userid;
  final String username;
  final int points;

  UserPoints({
    required this.imageurl,
    required this.userid,
    required this.username,
    required this.points,
  });
}
