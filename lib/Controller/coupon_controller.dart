import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/apiendpoints.dart';
import 'package:http/http.dart' as http;

class CouponController extends GetxController {
  var isLoading = true.obs;
  int? amount;

  // @override
  // void onInit() async {
  //   await getData();
  //   super.onInit();
  // }

  Future getData(var code) async {
    String token = GetStorage().read('token');
    try {
      var res = await http.post(
          Uri.parse("${APIEndPoints.BASE_URL}user/v2/order/coupon"),
          body: {'coupon_code': code},
          headers: {'Authorization': 'Bearer $token'});
      var data = json.decode(res.body);
      if (data["success"]!) {
        amount = data['data']['amount'];
        isLoading(false);
        update();
        return amount;
      } else {
        isLoading(false);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
