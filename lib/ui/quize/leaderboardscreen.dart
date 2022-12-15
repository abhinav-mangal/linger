import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/colors.dart';
import '../../Utils/keepalive.dart';
import '../widgets/screen_conatiner.dart';
import 'leaderboardlist.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen>
    with baseclass, SingleTickerProviderStateMixin {
  List<Widget> _leaderboardWidget = [];
  List<UserPoints> userpointdetail = [];
  String img =
      "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000&t=st=1662301789~exp=1662302389~hmac=50894fbaedda9f0899b5cc1d44f745c401744f6af744edf3c153b6b973407605";
  String img1 =
      "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=2000&t=st=1662301801~exp=1662302401~hmac=f9f405e754f1a5e9dacb772513b78aa85a5297fb2c3f6be97f02553c723b8c0a";
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _leaderboardWidget = <Widget>[
      KeepAlivePage(
          child: leaderboardlist(
        number: 0,
        userpointdetail: userpointdetail,
      )),
      KeepAlivePage(
          child: leaderboardlist(
        number: 1,
        userpointdetail: userpointdetail,
      )),
      KeepAlivePage(
          child: leaderboardlist(
        number: 2,
        userpointdetail: userpointdetail,
      )),
    ];
    return ScreenContainer(
      title: 'LeaderBoard',
      // leadingCallBack: () {},
      actions: [
        Container(
            margin: EdgeInsets.only(right: getW(20)),
            child: Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 22.sp,
            )),
      ],
      appBarElevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 6.w,
            right: 6.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: getH(10),
              ),
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: getH(35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      25.sp,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 25,
                        offset: const Offset(0, 4),
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(getH(5)),
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.sp,
                      ),
                      color: getColorFromHex(ColorConstants.lightblueishcolor),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.normal),

                    tabs: const [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'All Time',
                      ),

                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'This Week',
                      ),
                      Tab(
                        text: 'This Month',
                      ),
                    ],
                  ),
                ),
              ),
              // tab bar view here
              SizedBox(
                height: getH(700),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: _leaderboardWidget,
                ),
              ),
            ],
          ),
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
