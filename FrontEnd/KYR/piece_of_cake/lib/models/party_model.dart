import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';

import 'package:piece_of_cake/vo.dart';
import 'package:provider/provider.dart';

class PartyModel with ChangeNotifier {
  List<PartyResVO> _partyList = [];
  List<PartyResVO> get partyList => _partyList;
  List<PartyResVO> _bookmarkPartyList = [];  // bookmark list의 party들 목록
  List<PartyResVO> get bookmarkPartyList => _bookmarkPartyList;
  List<int> _bookmarkList = [];
  List<int> get bookmarkList => _bookmarkList;
  List<PartyResVO> _partyGuestList = [];
  List<PartyResVO> get partyGuestList => _partyGuestList;
  List<PartyResVO> _partyHostList = [];
  List<PartyResVO> get partyHostList => _partyHostList;
  PartyResVO? _currentParty;
  PartyResVO? get currentParty => _currentParty;
  
  Future fetchPartyList() async {
    final response = await
         http.get(Uri.parse('http://10.0.2.2:9090/party'));
    if (response.statusCode==200) {
      this._partyList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => PartyResVO.fromJson(e))
          .toList();
      print('[PartyModel] fetchPartyList() this._partyList: ${this._partyList}');
    }else {
      throw Exception('Failed to load party list.');
    }
    // notifyListeners();
  }

  Future createParty(partyReqVO, userSeq) async {
    print('[PartyModel] createParty(partyReqVO, userSeq) called');
    print('partyReqVO: ${partyReqVO}');
    print('userSeq: ${userSeq}');
    final response = await http.post(
      Uri.parse('http://10.0.2.2:9090/party/${userSeq}'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(partyReqVO),
    );
    print('response.statusCode: ${response.statusCode}');
    if (response.statusCode==200) {
      PartyResVO party = PartyResVO.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      _currentParty = party;
      print('!!!!!!!!!![PartyModel] createParty() _currentParty: ${_currentParty}');
      // print('!!!!!!!!!!this._currentParty.userResVO: ${this._currentParty!.userResVO}');
    }else {
      throw Exception('Failed to load detail party.');
    }
  }

  Future fetchPartyGuestList(int userSeq) async {
    print('[PartyModel] fetchPartyGuestList()');
    final response = await http.get(Uri.parse('http://10.0.2.2:9090/party/guest/${userSeq}'));
    print('response.statusCode: ${response.statusCode}');
    if (response.statusCode==200) {
      this._partyGuestList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => PartyResVO.fromJson(e))
          .toList();
      print('[PartyModel] fetchPartyGuestList() this._partyGuestList: ${this._partyGuestList}');
    } else {
      throw Exception('Failed to load party guest list.');
    }
    // notifyListeners();기
  }

  Future fetchPartyHostList(int userSeq) async {
    print('[PartyModel] fetchPartyHostList()');
    final response = await http.get(Uri.parse('http://10.0.2.2:9090/party/host/${userSeq}'));
    print('response.statusCode: ${response.statusCode}');
    if (response.statusCode==200) {
      this._partyHostList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => PartyResVO.fromJson(e))
          .toList();
      print('[PartyModel] fetchPartyHostList() this._partyHostList: ${this._partyHostList}');
    } else {
      throw Exception('Failed to load party host list.');
    }
    // notifyListeners();
  }
  
  Future fetchBookmarkPartyList(userSeq) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:9090/bookmark/${userSeq}'));
    if (response.statusCode==200) {
      this._bookmarkPartyList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => PartyResVO.fromJson(e))
          .toList();
      print('[PartyModel] fetchBookmarkPartyList() this._bookmarkPartyList: ${this._bookmarkPartyList}');
    }else {
      throw Exception('Failed to load bookmark party list');
    }
    // notifyListeners();
  }
  
  void fetchBookmarkList(userSeq) {
    this._bookmarkList = _bookmarkPartyList
        .map((e) => e.partySeq)
        .toList();
    // notifyListeners();
  }

  Future detailBookmark(BookmarkReqVO bookmarkReqVO) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:9090/party/${bookmarkReqVO.partySeq}')
    );
    if (response.statusCode==200) {
      PartyResVO party = PartyResVO.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      _currentParty = party;
    }else {
      throw Exception('Failed to load detail bookmark.');
    }
    // notifyListeners();
  }

  Future insertBookmark(BookmarkReqVO bookmarkReqVO) async {
    print('[PartyModel] insertBookmark()');
    print('bookmarkReqVO: ${bookmarkReqVO}');
    print('bookmarkReqVO.toJson(): ${bookmarkReqVO.toJson()}');
    print('jsonEncode(bookmarkReqVO): ${jsonEncode(bookmarkReqVO)}');
    final response = await http.post(
      Uri.parse('http://10.0.2.2:9090/bookmark'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bookmarkReqVO),
    );
    print('response.body: ${response.body}');
    if (response.statusCode==200) {
      await fetchPartyList();
      await fetchBookmarkPartyList(bookmarkReqVO.userSeq);
      fetchBookmarkList(bookmarkReqVO.userSeq);
    } else {
      throw Exception('Failed to insert bookmark.');
    }
    // notifyListeners();
  }

  Future deleteBookmark(BookmarkReqVO bookmarkReqVO) async {
    print('[PartyModel] deleteBookmark()');
    print('bookmarkReqVO: ${bookmarkReqVO}');
    print('bookmarkReqVO.toJson(): ${bookmarkReqVO.toJson()}');
    print('jsonEncode(bookmarkReqVO): ${jsonEncode(bookmarkReqVO)}');
    final response = await http.delete(
      Uri.parse('http://10.0.2.2:9090/bookmark'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bookmarkReqVO),
    );
    print('response.body: ${response.body}');
    if (response.statusCode==200) {
      await fetchPartyList();
      await fetchBookmarkPartyList(bookmarkReqVO.userSeq);
      fetchBookmarkList(bookmarkReqVO.userSeq);
      print('_bookmarkList: ${_bookmarkList}');
    } else {
      throw Exception('Failed to delete bookmark');
    }
    // notifyListeners();
  }

  Future afterBookmark(BookmarkReqVO bookmarkReqVO) async {
    await fetchPartyList();
    await fetchBookmarkPartyList(bookmarkReqVO.userSeq);
    fetchBookmarkList(bookmarkReqVO.userSeq);
    // notifyListeners();
  }
}