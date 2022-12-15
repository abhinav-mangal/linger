import 'package:flutter/material.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Basepackage/baseclass.dart';

class ThemeModal with baseclass {
  final Color textColor;
  final Color appBar;
  final Color? screenColor;
  final Color cardsColors;
  final Color arrowIconColor;
  final Color iconColor;

  ThemeModal(
      {required this.textColor,
      required this.appBar,
      this.screenColor,
      required this.cardsColors,
      required this.arrowIconColor,
      required this.iconColor});

  factory ThemeModal.changeTheme(Map<String, Color> colorJson) => ThemeModal(
        textColor: colorJson["textColor"] as Color,
        appBar: colorJson["appBar"] as Color,
        screenColor: colorJson["screenColor"] as Color,
        cardsColors: colorJson["cardsColors"] as Color,
        arrowIconColor: colorJson["arrowIconColor"] as Color,
        iconColor: colorJson["iconColor"] as Color,
      );
}
