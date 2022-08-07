import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:piece_of_cake/kakao/social_login.dart';

class KakaoLoginViewModel {
  // class KakaoLoginViewModel extends GetxController{
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  KakaoLoginViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }

  Future<User> me() async {
    User user = await _socialLogin.me();
    return user;
  }
}