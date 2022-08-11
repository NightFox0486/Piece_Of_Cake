import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/kakao/kakao_login.dart';
import 'package:piece_of_cake/kakao/kakao_login_view_model.dart';
import './notice.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  final kakaoLoginViewModel = KakaoLoginViewModel(KakaoLogin());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notice()),
                );
              },
              icon: Icon(Icons.notifications)
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // Image.network(kakaoLoginViewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
              // Text(kakaoLoginViewModel.user?.kakaoAccount?.profile?.nickname ?? ''),
              // Text(kakaoLoginViewModel.user?.kakaoAccount?.email ?? '')
              Image.asset('assets/images/harry.png')
            ],
          ),

        ],
      )
    );
  }
}

// class My extends StatelessWidget {
//   const My({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('My')
//       ),
//     );
//   }
// }