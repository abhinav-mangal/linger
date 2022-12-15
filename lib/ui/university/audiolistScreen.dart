import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/customText.dart';
import '../../models/librarypage/libraryResponse.dart';
import 'audiodetail.dart';

class AudioListScreen extends StatefulWidget {
  final List<Audi> audio;
  const AudioListScreen({Key? key, required this.audio}) : super(key: key);

  @override
  State<AudioListScreen> createState() => _AudioListScreenState();
}

class _AudioListScreenState extends State<AudioListScreen> with baseclass {
  Audi? audio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3.79.h,
        leading: IconButton(
            padding: EdgeInsets.fromLTRB(4.1.w, 0, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.sp,
            )),
        titleSpacing: 7.3.w,
        title: CustomText(
          text: "Audio Summary",
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          // marginvalue: EdgeInsets.only(left: 6.w),
          textsize: 20.sp,
          align: Alignment.centerLeft,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 8.2.w,
        actions: [
          IconButton(
              padding: EdgeInsets.fromLTRB(4.w, 0, 8.w, 0),
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 22.sp,
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: getH(8)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 0.18.h);
                  },
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.audio != null ? widget.audio.length : 0,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    audio = widget.audio[index];
                    return AudioTile(audio!.image!, audio!.title!, () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AudioDetail(
                                    audio: widget.audio[index],
                                  )));
                    },
                        Image.asset(
                          "assets/images/play.png",
                          // height: 5.64.w,
                          // width: 5.64.w,
                          height: getH(26),
                          width: getH(26),
                        ),
                        true);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioTile extends StatelessWidget with baseclass {
  AudioTile(this.moreimage, this.morename, this.morefunction,
      this.trailingwidget, this.arrowshow);
  final Widget trailingwidget;
  final String moreimage;
  final String morename;
  final Function() morefunction;
  final bool arrowshow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: InkWell(
          onTap: morefunction,
          child: Container(
            margin: EdgeInsets.only(top: getH(16)),
            padding: EdgeInsets.only(
                left: getW(12),
                right: getW(12),
                top: getH(12),
                bottom: getH(12)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                12.sp,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.sp),
                    child: Image.network(
                      moreimage,
                      height: getH(64),
                      width: getH(64),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    morename,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                const Spacer(),
                Visibility(visible: arrowshow, child: trailingwidget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
