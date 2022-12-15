import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/quize/quize_introduction.dart';
import 'package:linger/ui/quize/slotbox.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'leaderboard.dart';

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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(4.w, gettoppadding(context), 4.w, 0),
              child: Column(
                children: [
                  slotbox(
                      "Slot 1",
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const QuizIntroductionScreen())),
                      "time",
                      "10AM - 1PM",
                      true),
                  SizedBox(height: 1.42.h),
                  slotbox(
                      "Slot 2",
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const QuizIntroductionScreen())),
                      "time",
                      "10AM - 1PM",
                      false),
                ],
              ),
            ),
            LeaderBoard("Leaderboard", userpointdetail),
            SizedBox(height: getH(110)),
          ],
        ),
      ),
    );
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
