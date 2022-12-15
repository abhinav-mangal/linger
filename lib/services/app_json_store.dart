import 'package:json_store/json_store.dart';
import '../data/model/user_login_reponse_model.dart';

class AppJsonStore {
  late final JsonStore jsonStore;

  AppJsonStore.init() {
    jsonStore = JsonStore();
  }

  Future<UserLoginResponseModel?> getUserData() async {
    final jsonData = await jsonStore.getItem('user_session');
    if (jsonData != null) {
      return UserLoginResponseModel.fromJson(jsonData);
    }
    return null;
  }

  Future<void> setUserData(UserLoginResponseModel userDataModel) async {
    await jsonStore.setItem('user_session', userDataModel.toJson());
  }

  Future<void> deleteUserSessionData() async {
    return await jsonStore.deleteItem('user_session');
  }
}
