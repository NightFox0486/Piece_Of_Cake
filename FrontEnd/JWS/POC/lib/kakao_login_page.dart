import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import 'main.dart';
import 'models/kakao_login_model.dart';

class KakaoLoginPage extends StatefulWidget {
  const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {

  final _database = FirebaseFirestore.instance;
  kakao.User? user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kakao Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                user = await kakao.UserApi.instance.me();
                // await KakaoLoginModel().setUser();
                await Provider.of<KakaoLoginModel>(context, listen: false).setUser();
                print('login');
                print('user: ${Provider.of<KakaoLoginModel>(context, listen: false).user}');
                Route route = MaterialPageRoute(builder: (context) => const MainPage());
                Navigator.pushReplacement(context, route);

                await _database.collection('users').doc("kakao:" + user!.id.toString()).set({
                  'uid': user!.id.toString(),
                  'username': user!.kakaoAccount!.profile!.nickname,
                }, SetOptions(merge: true));
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
