import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:piece_of_cake/widget.dart';
import 'package:provider/provider.dart';

import '../models/kakao_login_model.dart';
import '../models/party_model.dart';

class PartyList extends StatefulWidget {
  // const PartyList({Key? key}) : super(key: key);
  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  // GlobalKey<_PartyListState> partyListGlobalKey = GlobalKey();
  // var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    final partyProvider = Provider.of<PartyModel>(context);
    // Future refreshPartyList() async {
    //   refreshKey.currentState?.show(atTop: false);
    //   await partyProvider.fetchPartyList();
    //   await partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO!.userSeq);
    // }
    partyProvider.fetchPartyList();
    print('partyList: ${partyProvider.partyList}');
    final partyList = partyProvider.partyList;
    return Scaffold(
      appBar: AppBar(
          title: Text('PartyList'),
      ),
      body: ListView(
        children: [
          for (var party in partyList)
            Item(party),
            // Item(party, key: partyListGlobalKey),
          Container(
            margin: EdgeInsets.only(bottom: 50),
          )
        ]
      ),
      // body: RefreshIndicator(
      //   key: refreshKey,
      //   child: ListView(
      //       children: [
      //         for (var party in _partyList)
      //           Item(party, key: partyListGlobalKey),
      //         Container(
      //           margin: EdgeInsets.only(bottom: 50),
      //         )
      //       ]
      //   ),
      //   onRefresh: refreshPartyList,
      // ),
    );
  }

}