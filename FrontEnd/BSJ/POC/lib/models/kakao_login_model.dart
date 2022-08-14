import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:piece_of_cake/kakao/social_login.dart';

import '../../kakao/kakao_login.dart';

class KakaoLoginModel with ChangeNotifier {
  SocialLogin _socialLogin = KakaoLogin();
  bool isLoggedIn = false;
  User? _user;
  UserResVO? _userResVO;  // _userResVO.userSeq
  // int? userSeq;
  User? get user => _user;
  UserResVO? get userResVO => _userResVO;
  Future setUser() async {
    var keyHash = await KakaoSdk.origin;
    print('keyHash: ${keyHash}');
    isLoggedIn = await _socialLogin.login();
    if (isLoggedIn) {
      this._user = await UserApi.instance.me();
      UserReqVO userReqVO = new UserReqVO(
        userEmail: this._user!.kakaoAccount!.email.toString(),
        userPhone: this._user!.kakaoAccount!.phoneNumber.toString(),
        userNickname: this._user!.kakaoAccount!.profile!.nickname.toString(),
        userImage: this._user!.kakaoAccount!.profile!.profileImageUrl.toString(),
        userKakaoLoginId: this._user?.id.toString(),
      );
      final response = await http.post(
        // Uri.parse('http://localhost:9090/kakao-login'),
        Uri.parse('http://i7e203.p.ssafy.io:9090/kakao-login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userReqVO),
      );
      if (response.statusCode==200) {
        this._userResVO = UserResVO.fromJson(jsonDecode(response.body));
        print('login post req 200');
        print(jsonDecode(response.body));
      }else {
        print('response.statusCode: ${response.statusCode}');
      }
    }


    print('kakao login model');
    print('_user: ${_user}');
    print('_userResVO: ${_userResVO}');
    notifyListeners();
  }

  Future logOut() async {
    await _socialLogin.logout();
    isLoggedIn = false;
    _user = null;
    notifyListeners();
  }
}

class UserReqVO {
  String userEmail;
  String userPhone;
  String userNickname;
  String userImage;
  String? userPassword;
  int? userRating;
  String? userLat;
  String? userLng;
  String? userAccount;
  String? userKakaoLoginId;
  UserReqVO({
    required this.userEmail,
    required this.userPhone,
    required this.userNickname,
    required this.userImage,
    this.userPassword,
    this.userRating,
    this.userLat,
    this.userLng,
    this.userAccount,
    this.userKakaoLoginId,
  });
  factory UserReqVO.fromJson(Map<String, dynamic> json) {
    return UserReqVO(
        userEmail: json['userEmail'],
        userPhone: json['userPhone'],
        userNickname: json['userNickname'],
        userImage: json['userImage'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userNickname'] = this.userNickname;
    data['userImage'] = this.userImage;
    data['userPassword'] = this.userPassword;
    data['userRating'] = this.userRating;
    data['userLat'] = this.userLat;
    data['userLng'] = this.userLng;
    data['userAccount'] = this.userAccount;
    data['userKakaoLoginId'] = this.userKakaoLoginId;
    return data;
  }
}

class UserResVO {
  int userSeq;
  String userEmail;
  String userPhone;
  String userNickname;
  String userImage;
  String? userPassword;
  int? userRating;
  String? userLat;
  String? userLng;
  String? userAccount;
  String? userKakaoLoginId;
  UserResVO({
    required this.userSeq,
    required this.userEmail,
    required this.userPhone,
    required this.userNickname,
    required this.userImage,
    this.userPassword,
    this.userRating,
    this.userLat,
    this.userLng,
    this.userAccount,
    this.userKakaoLoginId,
  });
  factory UserResVO.fromJson(Map<String, dynamic> json) {
    return UserResVO(
      userSeq: json['userSeq'],
      userEmail: json['userEmail'],
      userPhone: json['userPhone'],
      userNickname: json['userNickname'],
      userImage: json['userImage'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userSeq'] = this.userSeq;
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userNickname'] = this.userNickname;
    data['userImage'] = this.userImage;
    data['userPassword'] = this.userPassword;
    data['userRating'] = this.userRating;
    data['userLat'] = this.userLat;
    data['userLng'] = this.userLng;
    data['userAccount'] = this.userAccount;
    data['userKakaoLoginId'] = this.userKakaoLoginId;
    return data;
  }
}