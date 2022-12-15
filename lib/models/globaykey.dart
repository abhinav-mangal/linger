import 'package:flutter/cupertino.dart';
import 'package:linger/models/userData.dart';

class GlobalData extends ChangeNotifier {
  static final GlobalData instance = GlobalData._internal();
  factory GlobalData() {
    return instance;
  }

  GlobalData._internal();

  User userData = User(
      address: "",
      createdAt: "",
      deviceId: "",
      email: "",
      emailVerifiedAt: "",
      fecebookAccountLink: "",
      id: 0,
      image: "",
      instagramAccountLink: "",
      loginStatus: "",
      mobileNo: "",
      name: "",
      otp: "",
      primeStatus: 0,
      role: "",
      totalFollowers: 0,
      totalFollowing: 0,
      totalLike: 0,
      twitterAccountLink: "",
      updatedAt: "");

  updateUserData({required User newData}) {
    userData = newData;
    notifyListeners();
  }
}
