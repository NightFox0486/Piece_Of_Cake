import 'package:flutter/material.dart';
import 'package:piece_of_cake/home.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'models/kakao_login_model.dart';

class KakaoLoginPage extends StatefulWidget {
  const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
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
                // await KakaoLoginModel().setUser();
                await Provider.of<KakaoLoginModel>(context, listen: false).setUser();
                print('login');
                print('user: ${Provider.of<KakaoLoginModel>(context, listen: false).user}');
                Route route = MaterialPageRoute(builder: (context) => const MainPage());
                Navigator.pushReplacement(context, route);
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
