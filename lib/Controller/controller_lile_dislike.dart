import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:linger/constants/apiendpoints.dart';

class LikeDislikeController extends GetxController {
  var isLoading = false.obs;
  int? status;

  Future<void> likeDislike({
    required int productId,
    required int status,
  }) async {
    try {
      var res = await http.post(
          Uri.parse("${APIEndPoints.BASE_URL}user/v2/product/like"),
          headers: {
            'Authorization': 'Bearer ${GetStorage().read('token')}'
          },
          body: {
            "is_product": "$productId",
            "status": "$status",
          });
      var data = json.decode(res.body);
      if (data["success"]) {
        status = data["data"];
        update();
        // await GetStorage().write('token', data.token);
        // SignInCubit().success(data);
        isLoading(false);
        // FlushBarNotification.showSnack(title: "Login Success");
      } else {
        isLoading(false);
        // FlushBarNotification.showSnack(title: "Login Failed");
      }
    } finally {
      isLoading(false);
    }
  }
}
