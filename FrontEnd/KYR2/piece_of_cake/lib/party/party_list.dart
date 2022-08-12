import 'package:flutter/material.dart';

import 'package:piece_of_cake/widget.dart';
import 'package:provider/provider.dart';

import '../models/kakao_login_model.dart';
import '../models/party_model.dart';

class PartyList extends StatefulWidget {
  const PartyList({Key? key}) : super(key: key);

  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    final partyProvider = Provider.of<PartyModel>(context);
    final _partyList = partyProvider.partyList;
    return Scaffold(
      appBar: AppBar(
          title: Text('PartyList'),
      ),
      body: ListView(
          children: [
            for (var party in _partyList)
              Item(party),
            Container(
              margin: EdgeInsets.only(bottom: 50),
            )
          ]
      ),
    );
  }
}