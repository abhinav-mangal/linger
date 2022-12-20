import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:linger/Utils/flushbar_notification.dart';
import 'package:linger/constants/apiendpoints.dart';
import 'package:linger/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:linger/data/model/user_login_reponse_model.dart';

class GoogleLoginController extends GetxController {
  var isLoading = false.obs;

  void sendData(
      {required String name,
      required String email,
      required String uid}) async {
    isLoading(true);
    try {
      var res = await http.post(
          Uri.parse("${APIEndPoints.BASE_URL}social-media-signin"),
          body: {
            "name": name,
            "email": email,
            "uid": uid,
          });
      var data = UserLoginResponseModel.fromJson(json.decode(res.body));
      if (data.success!) {
        await GetStorage().write('token', data.token);
        SignInCubit().success(data);
        isLoading(false);
        FlushBarNotification.showSnack(title: "Login Success");
      } else {
        isLoading(false);
        FlushBarNotification.showSnack(title: "Login Failed");
      }
    } finally {
      isLoading(false);
      FlushBarNotification.showSnack(title: "Login Failed");
    }
  }
}
