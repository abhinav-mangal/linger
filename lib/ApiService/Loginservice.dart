import 'package:get_storage/get_storage.dart';
import 'package:linger/models/userData.dart';

import '../Utils/NetworkUtility.dart';
import '../constants/apiendpoints.dart';

class LoginService {
  Future<Userdatamodel> login(Map<String, dynamic> request) async {
    var data = await NetworkUtil.internal()
        .post(APIEndPoints.BASE_URL2 + APIEndPoints.SIGN_IN, body: request);
    var response = data[0];
    if (response is Map) {
      var data = Userdatamodel.fromJson(response as Map<String, dynamic>);
      return data;
    } else {
      return Userdatamodel(
          code: 0,
          success: false,
          message: "Something went wrong!",
          user: null,
          token: "");
    }
  }
}
