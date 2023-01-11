import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:linger/Utils/flushbar_notification.dart';
import 'package:linger/ui/OtpScreen.dart';

import '../constants/apiendpoints.dart';
import '../ui/loginscreen.dart';

class UpdatePasswordController extends GetxController {
  bool isLoading = true;
  TextEditingController newPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  Future updatePassword(
      {required int uid, required BuildContext context}) async {
    try {
      var res = await http.post(
        Uri.parse("${APIEndPoints.BASE_URL}update-password"),
        body: {
          "uid": "$uid",
          "new_password": newPassword.text,
          "new_confirm_password": newPassword.text,
        },
      );
      var data = json.decode(res.body);
      if (data["success"] == true) {
        FlushBarNotification.showSnack(title: "Password Updated");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => true);
      } else {
        isLoading = false;
        FlushBarNotification.showSnack(title: "Something went wrong!");
        update();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      update();
    }
  }

  Future updatePasswordEmail(BuildContext context) async {
    try {
      var res = await http.post(
        Uri.parse("${APIEndPoints.BASE_URL}reset-password-email"),
        body: {
          "email": email.text,
        },
      );
      var data = json.decode(res.body);
      if (data["success"] == true) {
        FlushBarNotification.showSnack(title: data["message"]);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtpScreen()));
      } else {
        isLoading = false;
        FlushBarNotification.showSnack(title: data["message"]);
        update();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      update();
    }
  }
}
