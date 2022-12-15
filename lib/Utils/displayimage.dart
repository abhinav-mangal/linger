import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Basepackage/baseclass.dart';
import 'colors.dart';
import 'customText.dart';

class DisplayImage extends StatelessWidget with baseclass {
  final String imagePath;
  final Color colr;
  final String number;
  final VoidCallback onPressed;
  final double circleheight;
  final double circlewidth;

  // Constructor
  DisplayImage({
    Key? key,
    required this.imagePath,
    required this.colr,
    required this.number,
    required this.onPressed,
    required this.circleheight,
    required this.circlewidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.grey;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.lightBlueAccent),
          ),
          child: Container(
            height: circleheight,
            width: circlewidth,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                  width: 4, color: getColorFromHex(ColorConstants.white)),
            ),
          ),
        ),
      ],
    );

    // return Center(
    //     child: Stack(
    //         alignment: Alignment.center,
    //         children: [
    //       Container(
    //           child: buildImage(color)),
    //       Positioned.fill(
    //         child: Align(
    //           child: buildEditIcon(color),
    //           alignment: Alignment.bottomCenter,
    //         ),
    //       )
    //     ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? NetworkImage(
            imagePath,
          )
        : FileImage(
            File(imagePath),
          );

    return Container(
      height: circleheight,
      width: circlewidth,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(35),
        color: Colors.white,
        image: DecorationImage(
          image: image as ImageProvider,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
            width: 6, color: getColorFromHex(ColorConstants.lightgreycolor)),
      ),
    );

    // return CircleAvatar(
    //   radius: 75,
    //   backgroundColor: color,
    //   child: CircleAvatar(
    //     backgroundImage: image as ImageProvider,
    //     radius: 70,
    //   ),
    // );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
        all: 12,
        child: Center(
          child: CustomText(
            text: number,
            familytype: 3,
            linecount: 1,
            textcolor: Colors.white,
            textsize: 15,
          ),
        ),
      );

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      Container(
        height: 3.h,
        width: 3.h,
        // padding: EdgeInsets.all(all),
        // padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(35),
          color: colr,
        ),
        child: child,
      );
}
