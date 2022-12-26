import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/hijiri_model.dart';

class HijiriController extends GetxController {
  bool isLoading = true;
  String hijiriDate = "";

  Future hijiriDateConverter(String date) async {
    try {
      var res = await http.get(
        Uri.parse('http://api.aladhan.com/v1/gToH?date=${date}'),
      );
      var data = HijiriModel.fromJson(json.decode(res.body));
      if (data.code == 200) {
        hijiriDate =
            "${data.data!.hijri!.day} ${data.data!.hijri!.month!.en} ${data.data!.hijri!.year} ${data.data!.hijri!.designation!.abbreviated}";
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      update();
    } finally {
      isLoading = false;
      update();
    }
  }
}
