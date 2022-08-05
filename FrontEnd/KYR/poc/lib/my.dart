import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class My extends StatelessWidget {
  const My({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My')
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
