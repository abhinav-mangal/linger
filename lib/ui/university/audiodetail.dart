import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/university/positionseek.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../models/librarypage/libraryResponse.dart';

class AudioDetail extends StatefulWidget {
  final Audi audio;
  const AudioDetail({Key? key, required this.audio}) : super(key: key);

  @override
  AudioDetailState createState() => AudioDetailState();
}

class AudioDetailState extends State<AudioDetail>
    with SingleTickerProviderStateMixin, baseclass {
  late AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    audioPlayer.open(Audio.network(widget.audio.audio!),
        autoStart: false, showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColorFromHex(ColorConstants.courseFieldColor).withOpacity(1.0),
            getColorFromHex(ColorConstants.courseFieldColor).withOpacity(0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: gettoppadding(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.only(left: 4.w),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                ),
                CustomText(
                  textalign: TextAlign.start,
                  align: Alignment.topLeft,
                  text: "Audio Summary",
                  familytype: 2,
                  textsize: 20.sp,
                  marginvalue: EdgeInsets.only(
                    left: getW(10),
                  ),
                  textcolor: getColorFromHex(ColorConstants.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getH(33),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.audio.image!,
                height: getH(300),
              ),
            ],
          ),
          SizedBox(
            height: getH(30),
          ),
          CustomText(
            marginvalue: EdgeInsets.only(left: 6.w),
            text: widget.audio.title!,
            familytype: 1,
            linecount: 1,
            textcolor: getColorFromHex(ColorConstants.black),
            textsize: 20.sp,
          ),
          SizedBox(
            height: getH(50),
          ),
          audioPlayer.builderRealtimePlayingInfos(
              builder: (context, RealtimePlayingInfos? infos) {
            if (infos == null) {
              return const SizedBox();
            }
            //print('infos: $infos');
            return Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w),
              child: Column(
                children: [
                  PositionSeekWidget(
                    currentPosition: infos.currentPosition,
                    duration: infos.duration,
                    seekTo: (to) {
                      audioPlayer.seek(to);
                    },
                  ),
                ],
              ),
            );
          }),
          SizedBox(
            height: getH(50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  CupertinoIcons.backward_fill,
                  color: Colors.green,
                  size: 24.sp,
                ),
                onTap: () {
                  audioPlayer.seekBy(const Duration(seconds: -10));
                },
              ),
              SizedBox(
                width: getW(40),
              ),
              GestureDetector(
                onTap: () {
                  AnimateIcon();
                },
                child: Container(
                  // padding: EdgeInsets.all(getH(20)),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(getH(20)),
                    child: Center(
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: iconController,
                        size: 24.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getW(40),
              ),
              InkWell(
                child: Icon(
                  CupertinoIcons.forward_fill,
                  color: Colors.green,
                  size: 24.sp,
                ),
                onTap: () {
                  audioPlayer.seekBy(const Duration(seconds: 10));
                  audioPlayer.seek(const Duration(seconds: 10));
                  audioPlayer.next();
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        iconController.forward();
        audioPlayer.play();
      } else {
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
