import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:piece_of_cake/kakao/social_login.dart';

import '../../kakao/kakao_login.dart';

class KakaoLoginModel with ChangeNotifier {
  SocialLogin _socialLogin = KakaoLogin();
  bool isLoggedIn = false;
  User? _user;
  User? get user => _user;
  Future setUser() async {
    isLoggedIn = await _socialLogin.login();
    if (isLoggedIn) {
      this._user = await UserApi.instance.me();
    }
    print('kakao login model');
    print(_user);
    notifyListeners();
  }

  Future logOut() async {
    await _socialLogin.logout();
    isLoggedIn = false;
    _user = null;
    notifyListeners();
  }
}