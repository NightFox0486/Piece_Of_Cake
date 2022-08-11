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
  List<Party> _wishPartyList = [];  // wish list의 party들 목록
  List<Party> get wishPartyList => _wishPartyList;
  List<int> _wishList = [];
  List<int> get wishList => _wishList;
  
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
  
  Future fetchWishPartyList(userSeq) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:9090/wish/${userSeq}'));
    if (response.statusCode==200) {
      this._wishPartyList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => Party.fromJson(e))
          .toList();
      print('[PartyModel] fetchWishList() this._wishList: ${this._wishPartyList}');
    }else {
      throw Exception('Failed to load wish list');
    }
    notifyListeners();
  }
  
  void fetchWishList(userSeq) {
    print('wishList: ${wishList}');
    this._wishList = _wishPartyList
        .map((e) => e.partySeq)
        .toList();
    print('wishList: ${wishList}');
    notifyListeners();
  }

  Future insertWishList(WishReqVO wishReqVO) async {
    print('[PartyModel] insertWishList()');
    print('wishReqVO: ${wishReqVO}');
    print('wishReqVO.toJson(): ${wishReqVO.toJson()}');
    print('jsonEncode(wishReqVO): ${jsonEncode(wishReqVO)}');
    final response = await http.post(
      Uri.parse('http://10.0.2.2:9090/wish'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: wishReqVO.toJson(),
      body: jsonEncode(wishReqVO),
    );
    print('response.body: ${response.body}');
    if (response.statusCode==200) {
      await fetchWishPartyList(wishReqVO.userSeq);
      await fetchPartyList();
    } else {
      throw Exception('Failed to insert wish list.');
    }
    notifyListeners();
  }

  Future deleteWishList(WishReqVO wishReqVO) async {
    final response = await http.delete(
      Uri.parse('http://10.0.2.2:9090/wish'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(wishReqVO),
    );
    print('response.body: ${response.body}');
    if (response.statusCode==200) {
      await fetchWishPartyList(wishReqVO.userSeq);
      await fetchPartyList();
    } else {
      throw Exception('Failed to delete wish list');
    }
    notifyListeners();
  }
}