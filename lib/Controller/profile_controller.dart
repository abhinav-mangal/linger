import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linger/data/model/post_response_model.dart';
import 'package:linger/data/model/user_profile_model.dart';

import '../constants/apiendpoints.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var isLoading = true.obs;
  PersonalData? profileData;

  String name = "";
  String facebookLink = "";
  String instagramLink = "";
  String twitterLink = "";

  List<Cover> cover = [];

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  Future getData() async {
    String token = GetStorage().read('token');
    try {
      var res = await http.get(
          Uri.parse(APIEndPoints.BASE_URL + APIEndPoints.PERSONSAL_PROFILE),
          headers: {'Authorization': 'Bearer $token'});
      var data = PersonalProfileModel.fromJson(json.decode(res.body));
      if (data.success!) {
        profileData = data.data!;
        name = data.data!.user!.name!;
        facebookLink = data.data!.user!.fecebookAccountLink!;
        instagramLink = data.data!.user!.instagramAccountLink!;
        twitterLink = data.data!.user!.twitterAccountLink!;
        cover = data.data!.cover!;
        isLoading(false);
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

  void updateProfile(
    var body, {
    required String token,
    required BuildContext context,
  }) async {
    try {
      var res = await http.post(
          Uri.parse(APIEndPoints.BASE_URL + APIEndPoints.PROFILE_UPDATE),
          body: body,
          headers: {'Authorization': 'Bearer $token'});
      var data = PostResponseModel.fromJson(json.decode(res.body));
      if (data.success!) {
        ProfileController controller = Get.put(ProfileController());
        controller.getData();
        Navigator.pop(context);
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

  void updateCover(var body) async {
    try {
      var res = await http.post(
          Uri.parse(APIEndPoints.BASE_URL + APIEndPoints.PROFIlE_COURSE),
          body: body,
          headers: {'Authorization': 'Bearer ${GetStorage().read('token')}'});
      var data = PostResponseModel.fromJson(json.decode(res.body));
      if (data.success!) {
        print(data.message!);
        getData();
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

  Future updateImage({File? file, required Map<String, String> body}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      var request = http.MultipartRequest("POST",
          Uri.parse(APIEndPoints.BASE_URL + APIEndPoints.PROFILE_IMAGE));
      request.headers.addAll(body);
      var stream = http.ByteStream(Stream.castFrom(file.openRead()));
      var length = await file.length();

      var multipartFileSign = http.MultipartFile(
        'image',
        stream,
        length,
        filename: file.path,
      );
      request.files.add(multipartFileSign);
      request.headers.addAll({"Content-Type": "multipart/form-data;"});
      var response = await request.send();
      var res = await response.stream.bytesToString();
      var data = json.decode(res);
      return data;
    }
  }
}
