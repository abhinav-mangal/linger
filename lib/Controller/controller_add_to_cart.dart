import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:linger/constants/apiendpoints.dart';

class AddToCartController extends GetxController {
  var isLoading = false.obs;

  Future<void> addToCart({
    required int productId,
    required int status,
    String? color,
    String? size,
    int? quantity,
  }) async {
    try {
      var res = await http.post(
          Uri.parse("${APIEndPoints.BASE_URL}user/v2/cart/store"),
          headers: {
            'Authorization': 'Bearer ${GetStorage().read('token')}'
          },
          body: {
            "product_id": "$productId",
            "status": "$status",
            "color": color,
            "size": size,
            "quantity": "$quantity",
          });
      var data = json.decode(res.body);
      if (data["success"]) {
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
