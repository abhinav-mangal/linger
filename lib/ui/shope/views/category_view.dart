import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      required this.title,
      required this.imgSrc,
      required this.ontap})
      : super(key: key);
  final String imgSrc;
  final String title;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 19.0.w,
            width: 19.0.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.sp)),
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                  .shade200,
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imgSrc,
                fit: BoxFit.cover,
                height: 10.7.w,
                width: 10.7.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15.sp, fontFamily: 'Reguler', color: Colors.black),
          ),
        )
      ],
    );
  }
}
