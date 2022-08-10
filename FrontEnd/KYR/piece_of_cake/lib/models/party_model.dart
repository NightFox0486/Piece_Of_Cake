import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';

import 'package:piece_of_cake/vo.dart';
import 'package:provider/provider.dart';

class PartyModel with ChangeNotifier {
  List<Party> _partyList = [];
  List<Party> get partyList => _partyList;
  List<Party> _wishList = [];
  List<Party> get wishList => _wishList;
  
  Future fetchPartyList() async {
    final response = await
         http.get(Uri.parse('http://10.0.2.2:9090/party'));
    if (response.statusCode==200) {
      this._partyList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => Party.fromJson(e))
          .toList();
      print('[PartyModel] fetchPartyList() this._partyList: ${this._partyList}');
    }else {
      throw Exception('Failed to load party list.');
    }
    notifyListeners();
  }
  
  Future fetchWishList(userSeq) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:9090/wish/${userSeq}'));
    if (response.statusCode==200) {
      this._wishList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => Party.fromJson(e))
          .toList();
      print('[PartyModel] fetchWishList() this._wishList: ${this._wishList}');
    }else {
      throw Exception('Failed to load wish list');
    }
    notifyListeners();
  }
}