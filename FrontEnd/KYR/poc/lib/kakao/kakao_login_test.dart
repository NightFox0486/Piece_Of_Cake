import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

// https://developers.kakao.com/docs/latest/ko/kakaologin/flutter#sample-login
void main() {
  KakaoSdk.init(nativeAppKey: '2157d1da3704b84b219793633746ca5c');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Future<void> kakaoSaveUserInfo() async {
  //   try {
  //     // 저장할 사용자 프로퍼티
  //     Map<String, String> properties = {'${CUSTOM_PROPERTY_KEY}': '${CUSTOM_PROPERTY_VALUE}'};
  //     await UserApi.instance.updateProfile(properties);
  //     print('사용자 정보 저장 성공');
  //   } catch (error) {
  //     print('사용자 정보 저장 실패 $error');
  //   }
  // }
  Future<void> kakaoGetUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }
  Future<void> kakaoDisconnect() async {
    try {
      await UserApi.instance.unlink();
      print('연결 끊기 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('연결 끊기 실패 $error');
    }
  }
  Future<void> kakaoLogout() async {
    try {
      await UserApi.instance.logout();
      print('로그아웃 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('로그아웃 실패, SDK에서 토큰 삭제 $error');
    }
  }
  // Future<void> kakaoLogin() async {
  //   if (await AuthApi.instance.hasToken()) {
  //     try {
  //       AccessTokenInfo tokenInfo =
  //       await UserApi.instance.accessTokenInfo();
  //       print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
  //     } catch (error) {
  //       if (error is KakaoException && error.isInvalidTokenError()) {
  //         print('토큰 만료 $error');
  //       } else {
  //         print('토큰 정보 조회 실패 $error');
  //       }
  //
  //       if (await isKakaoTalkInstalled()) {
  //         try {
  //           await UserApi.instance.loginWithKakaoTalk();
  //           print('카카오톡으로 로그인 성공');
  //         } catch (error) {
  //           print('카카오톡으로 로그인 실패 $error');
  //
  //           // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
  //           // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
  //           if (error is PlatformException && error.code == 'CANCELED') {
  //             return;
  //           }
  //           // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
  //           try {
  //             await UserApi.instance.loginWithKakaoAccount();
  //             print('카카오계정으로 로그인 성공');
  //           } catch (error) {
  //             print('카카오계정으로 로그인 실패 $error');
  //           }
  //         }
  //       } else {
  //         try {
  //           await UserApi.instance.loginWithKakaoAccount();
  //           print('카카오계정으로 로그인 성공');
  //         } catch (error) {
  //           print('카카오계정으로 로그인 실패 $error');
  //         }
  //       }
  //     }
  //   } else {
  //     print('발급된 토큰 없음');
  //     try {
  //       OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
  //       print('로그인 성공 ${token.accessToken}');
  //     } catch (error) {
  //       print('로그인 실패 $error');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kakao Login',
        home: KakaoLoginPage(),
    );
  }
}

class KakaoLoginPage extends StatefulWidget {
  // const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
