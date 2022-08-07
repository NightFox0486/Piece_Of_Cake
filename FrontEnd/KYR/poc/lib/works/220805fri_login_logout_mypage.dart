import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:piece_of_cake/kakao/kakao_login.dart';
import 'dart:convert';

import 'package:piece_of_cake/kakao/kakao_login_view_model.dart';

class My extends StatelessWidget {
  My({Key? key}) : super(key: key);
  final viewModel = KakaoLoginViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(
              '${viewModel.isLogined}'
            ),
            Text(viewModel.user?.kakaoAccount?.email ?? ''),
            Text(viewModel.user?.kakaoAccount?.profile?.nickname ?? ''),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  // Future<void> fetchPartyList() async {
  //   final response = await http.get(Uri.parse('http://localhost:9090/user'));
  //   if (response.statusCode==200) {
  //     this.partyList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
  //         .map((e) => Party.fromJson(e))
  //         .toList();
  //     print(partyList);
  //   }else {
  //     throw Exception('Failed to load party list.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
