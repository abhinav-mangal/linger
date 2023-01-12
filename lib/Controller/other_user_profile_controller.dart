import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:linger/models/other_user_profile_model.dart';

import '../Utils/flushbar_notification.dart';
import '../constants/apiendpoints.dart';

class OtherUserProfileController extends GetxController {
  var isLoading = true.obs;
  var isFollow = false.obs;
  var isLike = false.obs;

  OtherUserProfileData? userData;

  Future getData(int id) async {
    try {
      var res = await http.get(
        Uri.parse("${APIEndPoints.BASE_URL}user/other-user-profile/$id"),
        headers: {'Authorization': 'Bearer ${GetStorage().read('token')}'},
      );
      var data = OtherUserProfileModel.fromJson(json.decode(res.body));
      if (data.success!) {
        userData = data.data;
        isFollow.value = data.data!.isFollow!;
        isLike.value = data.data!.isLike!;
        isLoading(false);
        update();
      } else {
        isLoading(false);
        FlushBarNotification.showSnack(title: data.message);
      }
    } finally {
      isLoading(false);
    }
  }

  Future userFollow(int id, int value) async {
    try {
      var res = await http
          .post(Uri.parse("${APIEndPoints.BASE_URL}user/follow"), headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}'
      }, body: {
        "is_user": id.toString(),
        "is_follow": value.toString(),
      });
      var data = json.decode(res.body);
      if (data["success"]) {
        // int isFollowing = data["data"][0]["is_follow"];
        // isFollow.value = isFollowing == 0 ? false : true;
        getData(id);
      } else {
        isLoading(false);
        FlushBarNotification.showSnack(title: data.message);
      }
    } finally {
      isLoading(false);
    }
  }

  Future userLike(int id, int value) async {
    try {
      var res = await http
          .post(Uri.parse("${APIEndPoints.BASE_URL}user/like"), headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}'
      }, body: {
        "is_user": id.toString(),
        "is_like": value.toString(),
      });
      var data = json.decode(res.body);
      if (data["success"]) {
        getData(id);
      } else {
        isLoading(false);
        FlushBarNotification.showSnack(title: data.message);
      }
    } finally {
      isLoading(false);
    }
  }
}
