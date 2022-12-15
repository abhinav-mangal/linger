import 'package:linger/models/userData.dart';

import '../Utils/NetworkUtility.dart';
import '../constants/apiendpoints.dart';

class LoginService {
  Future<Userdatamodel> login(Map<String, dynamic> request) async {
    var data = await NetworkUtil.internal()
        .post(APIEndPoints.BASE_URL2 + APIEndPoints.SIGN_IN, body: request);
    var response = data[0];
    if (response is Map) {
      return Userdatamodel.fromJson(response as Map<String, dynamic>);
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
