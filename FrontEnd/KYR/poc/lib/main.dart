import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:piece_of_cake/kakao/kakao_login_view_model.dart';

import 'package:piece_of_cake/kakao/kakao_login.dart';
import 'package:piece_of_cake/wish.dart';

import 'chat.dart';
import 'home.dart';
import 'login.dart';
import 'my.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '2157d1da3704b84b219793633746ca5c');
  runApp(const MyApp());
  // runApp(
  //     MaterialApp(
  //       initialRoute: '/',
  //       routes: {
  //         '/': (context) => const Home(),
  //         '/login': (context) => const LoginPage(),
  //         '/wish': (context) => const Wish(),
  //         '/chat': (context) => const Chat(),
  //         '/my': (context) => const My(),
  //       },
  //     )
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Piece Of Cake',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // kakao login user
  final viewModel = KakaoLoginViewModel(KakaoLogin());

  // navigation bar
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  // final screens = [
  //   '/',
  //   'wish',
  //   'chat',
  //   'my',
  // ];
  final screens = [
    Home(),
    Wish(),
    Chat(),
    My(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size:30),
      Icon(Icons.celebration, size:30),
      // Icon(Icons.add, size:30),
      Icon(Icons.question_answer, size:30),
      Icon(Icons.person, size:30),
    ];
    if (viewModel.isLogined) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Piece Of Cake'),
        ),
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          items: items,
          key: navigationKey,
          backgroundColor: Colors.white,
          color: Colors.pink,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('로그인 해야함'),
        ),
        body: LoginPage(),
      );
    }
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Piece Of Cake'),
    //   ),
    //   body: screens[index],
    //   bottomNavigationBar: CurvedNavigationBar(
    //     items: items,
    //     key: navigationKey,
    //     backgroundColor: Colors.white,
    //     color: Colors.pink,
    //     onTap: (index) {
    //       setState(() {
    //         this.index = index;
    //       });
    //     },
    //   ),
    // );
  }
}

