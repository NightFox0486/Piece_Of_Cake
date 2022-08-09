import 'package:flutter/material.dart';
import 'package:piece_of_cake/home.dart';
import 'package:piece_of_cake/kakao/kakao_login_view_model.dart';

import 'kakao/kakao_login.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'CongNamul',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const LoginPage()
    );  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = KakaoLoginViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async{
                await viewModel.login();
                setState(() {
                  Route route = MaterialPageRoute(builder: (context) => MainPage());
                  Navigator.pushReplacement(context, route);
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
