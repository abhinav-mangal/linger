import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linger/models/sukoon_category_model.dart';
import 'package:linger/models/sukoon_home_model.dart';
import 'package:linger/models/sukoon_model.dart';
import 'package:linger/models/sukoon_subcategory_model.dart';

import '../constants/apiendpoints.dart';
import 'package:http/http.dart' as http;

class SukoonController extends GetxController {
  var isLoading = true.obs;
  var isLoading01 = true.obs;
  var isLoading02 = true.obs;
  var sukoonHomeCategories = <SukoonHomeCategorys>[].obs;
  var sukoonHomeTrending = <SukoonHomeTrending>[].obs;
  var sukoonCategories = <SukoonCategorys>[].obs;
  var sukoonMostLikes = <MostLink>[].obs;
  SukoonSubCategoryData? sukoonSubCategoryData;
  var sukoonData = <SukoonData>[].obs;
  List<SukoonSubCategoryBanner> banner = [];

  @override
  void onInit() async {
    await getHomeData();
    await getCategory();
    super.onInit();
  }

  Future getHomeData() async {
    String token = GetStorage().read('token');
    try {
      var res = await http.get(
          Uri.parse("${APIEndPoints.BASE_URL}user/sukoon/home"),
          headers: {'Authorization': 'Bearer $token'});
      var data = SukoonHomeModel.fromJson(json.decode(res.body));
      if (data.success!) {
        sukoonHomeCategories.value = data.data!.categorys!;
        sukoonHomeTrending.value = data.data!.trending!;
        isLoading(false);
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

  Future getCategory() async {
    String token = GetStorage().read('token');
    try {
      var res = await http.get(
          Uri.parse("${APIEndPoints.BASE_URL}user/sukoon/category"),
          headers: {'Authorization': 'Bearer $token'});
      var data = SukoonCategoryModel.fromJson(json.decode(res.body));
      if (data.success!) {
        sukoonCategories.value = data.data!.categorys!;
        sukoonMostLikes.value = data.data!.mostLink!;
        isLoading(false);
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

  Future getSubCategory(int cid) async {
    String token = GetStorage().read('token');
    try {
      var res = await http.post(
          Uri.parse("${APIEndPoints.BASE_URL}user/sukoon/subcategory"),
          body: {"cid": "$cid"},
          headers: {'Authorization': 'Bearer $token'});
      var data = SukoonSubCategoryModel.fromJson(json.decode(res.body));
      if (data.success!) {
        sukoonSubCategoryData = data.data!;
        banner = data.data!.banner!;
        isLoading01(false);
        update();
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

  Future getSukoon(int cid, int sid) async {
    String token = GetStorage().read('token');
    try {
      var res = await http.post(
          Uri.parse("${APIEndPoints.BASE_URL}user/sukoon"),
          body: {"cid": "$cid", "sid": "$sid"},
          headers: {'Authorization': 'Bearer $token'});
      var data = SukoonModel.fromJson(json.decode(res.body));
      if (data.success!) {
        sukoonData.value = data.data!;
        isLoading02(false);
      } else {
        isLoading02(false);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading02(false);
    } finally {
      isLoading02(false);
    }
  }

  // void updateProfile(
  //   var body, {
  //   required String token,
  //   required BuildContext context,
  // }) async {
  //   try {
  //     var res = await http.post(
  //         Uri.parse(APIEndPoints.BASE_URL + APIEndPoints.PROFILE_UPDATE),
  //         body: body,
  //         headers: {'Authorization': 'Bearer $token'});
  //     var data = PostResponseModel.fromJson(json.decode(res.body));
  //     if (data.success!) {
  //       ProfileController controller = Get.put(ProfileController());
  //       controller.getData();
  //       Navigator.pop(context);
  //       isLoading(false);
  //     } else {
  //       isLoading(false);
  //     }
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //     isLoading(false);
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
