import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter/services.dart';

import 'package:video_player/video_player.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final locator = GetIt.instance;
  final feedViewModel = GetIt.instance<FeedViewModel>();
  @override
  void initState() {
    feedViewModel.loadVideo(0);
    feedViewModel.loadVideo(1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) => videoScreen(),
        viewModelBuilder: () => feedViewModel);
  }

  Widget videoScreen() {
    return Scaffold(
      backgroundColor: GetIt.instance<FeedViewModel>().actualScreen == 0
          ? Colors.black
          : Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 2,
            onPageChanged: (value) {
              print(value);
              if (value == 1)
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
              else
                SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle.light);
            },
            itemBuilder: (context, index) {
              if (index == 0)
                return scrollFeed();
              else
                return profileView();
            },
          )
        ],
      ),
    );
  }

  Widget profileView() {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        "Charlotte Stone",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
                            height: 100.0,
                            width: 100.0,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "@Charlotte21",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "232",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              "1.3k",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              "12k",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Likes",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 47,
                          decoration: BoxDecoration(
                            color: Colors.pink[500],
                          ),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 45,
                          height: 47,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: Center(child: Icon(Icons.camera_alt)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 35,
                          height: 47,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: Center(child: Icon(Icons.arrow_drop_down)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.menu),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.black,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.black26,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //   Row(
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 160,
                    //           decoration: BoxDecoration(
                    //               color: Colors.black26,
                    //               border: Border.all(
                    //                   color: Colors.white70, width: .5)),
                    //           child: FittedBox(
                    //             child: CachedNetworkImage(
                    //               fit: BoxFit.fill,
                    //               imageUrl:
                    //                   "https://media.giphy.com/media/tOueglJrk5rS8/giphy.gif",
                    //               placeholder: (context, url) => Padding(
                    //                 padding: const EdgeInsets.all(35.0),
                    //                 child: CircularProgressIndicator(),
                    //               ),
                    //               errorWidget: (context, url, error) =>
                    //                   Icon(Icons.error),
                    //             ),
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           height: 160,
                    //           decoration: BoxDecoration(
                    //               color: Colors.black26,
                    //               border: Border.all(
                    //                   color: Colors.white70, width: .5)),
                    //           child: FittedBox(
                    //             child: CachedNetworkImage(
                    //               fit: BoxFit.fill,
                    //               imageUrl:
                    //                   "https://media.giphy.com/media/665IPY24jyWFa/giphy.gif",
                    //               placeholder: (context, url) => Padding(
                    //                 padding: const EdgeInsets.all(35.0),
                    //                 child: CircularProgressIndicator(),
                    //               ),
                    //               errorWidget: (context, url, error) =>
                    //                   Icon(Icons.error),
                    //             ),
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           height: 160,
                    //           decoration: BoxDecoration(
                    //               color: Colors.black26,
                    //               border: Border.all(
                    //                   color: Colors.white70, width: .5)),
                    //           child: FittedBox(
                    //             child: CachedNetworkImage(
                    //               fit: BoxFit.fill,
                    //               imageUrl:
                    //                   "https://media.giphy.com/media/chjX2ypYJKkr6/giphy.gif",
                    //               placeholder: (context, url) => Padding(
                    //                 padding: const EdgeInsets.all(35.0),
                    //                 child: CircularProgressIndicator(),
                    //               ),
                    //               errorWidget: (context, url, error) =>
                    //                   Icon(Icons.error),
                    //             ),
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //   Row(
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           height: 160,
                    //           decoration: BoxDecoration(
                    //               color: Colors.black26,
                    //               border: Border.all(
                    //                   color: Colors.white70, width: .5)),
                    //           child: FittedBox(
                    //             child: CachedNetworkImage(
                    //               fit: BoxFit.fill,
                    //               imageUrl:
                    //                   "https://media.giphy.com/media/sC60eX0OVIH7O/giphy.gif",
                    //               placeholder: (context, url) => Padding(
                    //                 padding: const EdgeInsets.all(35.0),
                    //                 child: CircularProgressIndicator(),
                    //               ),
                    //               errorWidget: (context, url, error) =>
                    //                   Icon(Icons.error),
                    //             ),
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           height: 160,
                    //           decoration: BoxDecoration(
                    //               color: Colors.black26,
                    //               border: Border.all(
                    //                   color: Colors.white70, width: .5)),
                    //           child: FittedBox(
                    //             child: CachedNetworkImage(
                    //               fit: BoxFit.fill,
                    //               imageUrl:
                    //                   "https://media.giphy.com/media/NsXhybxnMKsh2/giphy.gif",
                    //               placeholder: (context, url) => Padding(
                    //                 padding: const EdgeInsets.all(35.0),
                    //                 child: CircularProgressIndicator(),
                    //               ),
                    //               errorWidget: (context, url, error) =>
                    //                   Icon(Icons.error),
                    //             ),
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           height: 160,
                    //           decoration: BoxDecoration(
                    //               color: Colors.black26,
                    //               border: Border.all(
                    //                   color: Colors.white70, width: .5)),
                    //           child: FittedBox(
                    //             child: CachedNetworkImage(
                    //               fit: BoxFit.fill,
                    //               imageUrl:
                    //                   "https://media.giphy.com/media/HE6hyf47yAX1S/giphy.gif",
                    //               placeholder: (context, url) => Padding(
                    //                 padding: const EdgeInsets.all(35.0),
                    //                 child: CircularProgressIndicator(),
                    //               ),
                    //               errorWidget: (context, url, error) =>
                    //                   Icon(Icons.error),
                    //             ),
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                  ],
                ),
              ]))),
    );
  }

  Widget scrollFeed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: currentScreen()),
        BottomBar(),
      ],
    );
  }

  Widget feedVideos() {
    return Stack(
      children: [
        PageView.builder(
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          itemCount: feedViewModel.videoSource?.listVideos.length,
          onPageChanged: (index) {
            index = index % (feedViewModel.videoSource!.listVideos.length);
            feedViewModel.changeVideo(index);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            index = index % (feedViewModel.videoSource!.listVideos.length);
            return videoCard(feedViewModel.videoSource!.listVideos[index]);
          },
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Following',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white70)),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    color: Colors.white70,
                    height: 10,
                    width: 1.0,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text('For You',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ]),
          ),
        ),
      ],
    );
  }

  Widget currentScreen() {
    switch (feedViewModel.actualScreen) {
      case 0:
        return feedVideos();
      case 1:
        return SearchScreen();
      case 2:
        return MessagesScreen();
      case 3:
        return ProfileScreen();
      default:
        return feedVideos();
    }
  }

  Widget videoCard(Video video) {
    return Stack(
      children: [
        video.controller != null
            ? GestureDetector(
                onTap: () {
                  if (video.controller!.value.isPlaying) {
                    video.controller?.pause();
                  } else {
                    video.controller?.play();
                  }
                },
                child: SizedBox.expand(
                    child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: video.controller?.value.size.width ?? 0,
                    height: video.controller?.value.size.height ?? 0,
                    child: VideoPlayer(video.controller!),
                  ),
                )),
              )
            : Container(
                color: Colors.black,
                child: Center(
                  child: Text("Loading"),
                ),
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                VideoDescription(video.user, video.videoTitle, video.songName),
                ActionsToolbar(video.likes, video.comments,
                    "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    feedViewModel.controller?.dispose();
    super.dispose();
  }
}

class FeedViewModel extends ChangeNotifier {
  VideoPlayerController? controller;
  VideosAPI? videoSource;

  int prevVideo = 0;

  int actualScreen = 0;

  FeedViewModel() {
    videoSource = VideosAPI();
  }

  changeVideo(index) async {
    if (videoSource!.listVideos[index].controller == null) {
      await videoSource!.listVideos[index].loadController();
    }
    videoSource!.listVideos[index].controller!.play();
    //videoSource.listVideos[prevVideo].controller.removeListener(() {});

    if (videoSource!.listVideos[prevVideo].controller != null)
      videoSource!.listVideos[prevVideo].controller!.pause();

    prevVideo = index;
    notifyListeners();

    print(index);
  }

  void loadVideo(int index) async {
    if (videoSource!.listVideos.length > index) {
      await videoSource!.listVideos[index].loadController();
      videoSource!.listVideos[index].controller?.play();
      notifyListeners();
    }
  }

  void setActualScreen(index) {
    actualScreen = index;
    if (index == 0) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }
}

class MessagesScreen extends StatefulWidget {
  MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20,
                ),
                Row(
                  children: [
                    Text(
                      "All activity",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Icon(Icons.send)
              ],
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                TikTokIcons.messages,
                size: 80,
                color: Colors.black45,
              )
            ],
          ),
          SizedBox(height: 25),
          Text(
            "All activity",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(
            "Notifications about your account will appear here",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          ),
        ]),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person_add_alt_1_outlined),
                  Text(
                    "Salvador Valverde",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_horiz)
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png",
                          height: 100.0,
                          width: 100.0,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "@salvadordev",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "36",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        width: 1,
                        height: 15,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      Column(
                        children: [
                          Text(
                            "13",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        width: 1,
                        height: 15,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      Column(
                        children: [
                          Text(
                            "143",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 47,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)),
                        child: Center(
                          child: Text(
                            "Edit profile",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 45,
                        height: 47,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)),
                        child: Center(child: Icon(Icons.bookmark)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.menu),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.black,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/Ii4Cv63yG9iYawDtKC/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/tqfS3mgQU28ko/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/3o72EX5QZ9N9d51dqo/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/4oMoIbIQrvCjm/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/aZmD30dCFaPXG/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://media.giphy.com/media/NU8tcjnPaODTy/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 350,
                      height: 40,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.search),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Search")
                        ],
                      ),
                    ),
                    Icon(Icons.qr_code)
                  ],
                ),
              ),
            ])));
  }
}

class Video {
  String id;
  String user;
  String userPic;
  String videoTitle;
  String songName;
  String likes;
  String comments;
  String url;

  VideoPlayerController? controller;

  Video(
      {required this.id,
      required this.user,
      required this.userPic,
      required this.videoTitle,
      required this.songName,
      required this.likes,
      required this.comments,
      required this.url});

  Video.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        user = json['user'],
        userPic = json['user_pic'],
        videoTitle = json['video_title'],
        songName = json['song_name'],
        likes = json['likes'],
        comments = json['comments'],
        url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['user_pic'] = this.userPic;
    data['video_title'] = this.videoTitle;
    data['song_name'] = this.songName;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['url'] = this.url;
    return data;
  }

  Future<Null> loadController() async {
    controller = VideoPlayerController.network(url);
    await controller?.initialize();
    controller?.setLooping(true);
  }
}

class TikTokIcons {
  TikTokIcons._();

  static const _kFontFam = 'TikTokIcons';

  static const IconData chat_bubble =
      const IconData(0xe808, fontFamily: _kFontFam);
  static const IconData create = const IconData(0xe809, fontFamily: _kFontFam);
  static const IconData heart = const IconData(0xe80a, fontFamily: _kFontFam);
  static const IconData home = const IconData(0xe80b, fontFamily: _kFontFam);
  static const IconData messages =
      const IconData(0xe80c, fontFamily: _kFontFam);
  static const IconData profile = const IconData(0xe80d, fontFamily: _kFontFam);
  static const IconData reply = const IconData(0xe80e, fontFamily: _kFontFam);
  static const IconData search = const IconData(0xe80f, fontFamily: _kFontFam);
}

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;

  final String numLikes;
  final String numComments;
  final String userPic;

  ActionsToolbar(this.numLikes, this.numComments, this.userPic);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getFollowAction(pictureUrl: userPic),
        _getSocialAction(icon: TikTokIcons.heart, title: numLikes),
        _getSocialAction(icon: TikTokIcons.chat_bubble, title: numComments),
        _getSocialAction(
            icon: TikTokIcons.reply, title: 'Share', isShare: true),
        CircleImageAnimation(
          child: _getMusicPlayerAction(userPic),
        )
      ]),
    );
  }

  Widget _getSocialAction(
      {required String title, required IconData icon, bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon, size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 8.0 : 8.0),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: isShare ? 14.0 : 14.0)),
          )
        ]));
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child:
            Stack(children: [_getProfilePicture(pictureUrl), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }

  Widget _getProfilePicture(userPic) {
    return Positioned(
        left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
        child: Container(
            padding:
                EdgeInsets.all(1.0), // Add 1.0 point padding to create border
            height: ProfileImageSize, // ProfileImageSize = 50.0;
            width: ProfileImageSize, // ProfileImageSize = 50.0;
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedNetworkImage(
                  imageUrl: userPic,
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ))));
  }

  LinearGradient get musicGradient => LinearGradient(colors: [
        Colors.grey[800]!,
        Colors.grey[900]!,
        Colors.grey[900]!,
        Colors.grey[800]!
      ], stops: [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction(userPic) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(11.0),
              height: ProfileImageSize,
              width: ProfileImageSize,
              decoration: BoxDecoration(
                  gradient: musicGradient,
                  borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000.0),
                  child: CachedNetworkImage(
                    imageUrl: userPic,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ))),
        ]));
  }
}

class BottomBar extends StatelessWidget {
  static const double NavigationIconSize = 20.0;
  static const double CreateButtonWidth = 38.0;

  const BottomBar({Key? key}) : super(key: key);

  Widget get customCreateIcon => Container(
      width: 45.0,
      height: 27.0,
      child: Stack(children: [
        Container(
            margin: EdgeInsets.only(left: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0))),
        Container(
            margin: EdgeInsets.only(right: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0))),
        Center(
            child: Container(
          height: double.infinity,
          width: CreateButtonWidth,
          decoration: BoxDecoration(
              color: GetIt.instance<FeedViewModel>().actualScreen == 0
                  ? Colors.white
                  : Colors.black,
              borderRadius: BorderRadius.circular(7.0)),
          child: Icon(
            Icons.add,
            color: GetIt.instance<FeedViewModel>().actualScreen == 0
                ? Colors.black
                : Colors.white,
            size: 20.0,
          ),
        )),
      ]));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton('Home', TikTokIcons.home, 0),
              menuButton('Search', TikTokIcons.search, 1),
              SizedBox(
                width: 15,
              ),
              customCreateIcon,
              SizedBox(
                width: 15,
              ),
              menuButton('Messages', TikTokIcons.messages, 2),
              menuButton('Profile', TikTokIcons.profile, 3)
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 40 : 10,
          )
        ],
      ),
    );
  }

  Widget menuButton(String text, IconData icon, int index) {
    return GestureDetector(
        onTap: () {
          GetIt.instance<FeedViewModel>().setActualScreen(index);
        },
        child: Container(
          height: 45,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon,
                  color: GetIt.instance<FeedViewModel>().actualScreen == 0
                      ? GetIt.instance<FeedViewModel>().actualScreen == index
                          ? Colors.white
                          : Colors.white70
                      : GetIt.instance<FeedViewModel>().actualScreen == index
                          ? Colors.black
                          : Colors.black54,
                  size: NavigationIconSize),
              SizedBox(
                height: 7,
              ),
              Text(
                text,
                style: TextStyle(
                    fontWeight:
                        GetIt.instance<FeedViewModel>().actualScreen == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                    color: GetIt.instance<FeedViewModel>().actualScreen == 0
                        ? GetIt.instance<FeedViewModel>().actualScreen == index
                            ? Colors.white
                            : Colors.white70
                        : GetIt.instance<FeedViewModel>().actualScreen == index
                            ? Colors.black
                            : Colors.black54,
                    fontSize: 11.0),
              )
            ],
          ),
        ));
  }
}

class CircleImageAnimation extends StatefulWidget {
  CircleImageAnimation({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _CircleImageAnimationState createState() => _CircleImageAnimationState();
}

class _CircleImageAnimationState extends State<CircleImageAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.forward();
    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: widget.child);
  }
}

class VideoDescription extends StatelessWidget {
  final username;
  final videtoTitle;
  final songInfo;

  VideoDescription(this.username, this.videtoTitle, this.songInfo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 120.0,
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '@' + username,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    videtoTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(children: [
                    Icon(
                      Icons.music_note,
                      size: 15.0,
                      color: Colors.white,
                    ),
                    Text(songInfo,
                        style: TextStyle(color: Colors.white, fontSize: 14.0))
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                ])));
  }
}

class VideosAPI {
  List<Video> listVideos = <Video>[];

  VideosAPI() {
    load();
  }

  void load() async {
    listVideos = await getVideoList();
  }

  Future<List<Video>> getVideoList() async {
    // var data = await FirebaseFirestore.instance.collection("Videos").get();

    var videoList = <Video>[];
    var videos = reelVideos;

    // if (data.docs.length == 0) {
    //   await addDemoData();
    //   videos = (await FirebaseFirestore.instance.collection("Videos").get());
    // } else {
    //   videos = data;
    // }

    videos.forEach((element) {
      Video video = Video.fromJson(element);
      videoList.add(video);
    });

    return videoList;
  }

  // Future<Null> addDemoData() async {
  //   for (var video in data) {
  //     await FirebaseFirestore.instance.collection("Videos").add(video);
  //   }
  // }
}

var reelVideos = [
  {
    "id": "1",
    "video_title": "Video 1",
    "url": "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4",
    "comments": "143",
    "likes": "3223",
    "song_name": "Song 1 - Artist 1",
    "user": "User 1",
    "user_pic":
        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"
  },
  {
    "id": "2",
    "video_title": "Video 2",
    "url": "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4",
    "comments": "143",
    "likes": "3223",
    "song_name": "Song 2 - Artist 2",
    "user": "User 2",
    "user_pic":
        "https://i.pinimg.com/originals/5e/eb/8d/5eeb8d615bea040425f9937699392751.jpg"
  },
  {
    "id": "3",
    "video_title": "Video 3",
    "url": "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4",
    "comments": "143",
    "likes": "3223",
    "song_name": "Song 3 - Artist 3",
    "user": "User 3",
    "user_pic":
        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"
  },
];
