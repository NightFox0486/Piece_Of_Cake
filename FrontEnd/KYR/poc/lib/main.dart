import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:piece_of_cake/kakao/kakao_login_view_model.dart';

import 'package:piece_of_cake/kakao/kakao_login.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '2157d1da3704b84b219793633746ca5c');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = KakaoLoginViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(
              '${viewModel.isLogined}',
            ),
            ElevatedButton(
                onPressed: () async{
                  await viewModel.login();
                  setState(() {

                  }); // setState(() {}); <- 아무것도 안하고 화면 갱신
                },
                child: Text('Login')
            ),
            ElevatedButton(
                onPressed: () async{
                  await viewModel.logout();
                  setState(() {

                  });
                },
                child: Text('Logout')
            ),
            ElevatedButton(
              onPressed: () async {
                User user = await viewModel.me();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage(user)),
                );
              },
              child: Text('My Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  // MyPage(User user, {Key? key}) : super(key: key);
  late User _user;
  MyPage(User user) {
    this._user = user;
  }

  @override
  State<MyPage> createState() => _MyPageState(_user);
}

class _MyPageState extends State<MyPage> {
  late User _user;
  _MyPageState(User user) {
    this._user = user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(_user.id.toString()),
          Text(_user.kakaoAccount?.email ?? ''),
          Text(_user.kakaoAccount?.profile?.nickname ?? ''),
        ],
      ),
    );
  }
}
