import 'package:flutter/material.dart';

class SuccessScreenParams {
  final String? oid;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String buttonLabel;
  final String? buttonLabel2;
  final VoidCallback? onTapButton2;
  final Widget? subTitleView;

  SuccessScreenParams({
    this.oid,
    required this.buttonLabel,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.buttonLabel2,
    this.onTapButton2,
    this.subTitleView,
  });
}
