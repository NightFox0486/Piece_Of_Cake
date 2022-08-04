import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: PartyListScreen(),
  ));
}

class PartyListScreen extends StatefulWidget {
  PartyListScreen({super.key});
  List<Party> partyList = [];
  Future<List<Party>> fetchPartyList() async {
    final response = await http.get(Uri.parse('http://localhost:9090/party'));
    if (response.statusCode==200) {
      List<Party> _partyList = (jsonDecode(response.body) as List)
          .map((e) => Party.fromJson(e))
          .toList();
      print(_partyList);
      return _partyList;
    }else {
      throw Exception('Failed to load party list.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Party>> futurePartyList = fetchPartyList();
    // List<Party> partyList = [];
    futurePartyList.then((value) {
      value.forEach((e) {
        partyList.add(
          Party(partySeq: e.partySeq,
            userSeq: e.userSeq,
            partyTitle: e.partyTitle,
            partyContent: e.partyContent,
            partyRegDt: e.partyRegDt,
            partyUpdDt: e.partyUpdDt,
            partyRdvDt: e.partyRdvDt,
            partyRdvLat: e.partyRdvLat,
            partyRdvLng: e.partyRdvLng,
            partyMemberNumTotal: e.partyMemberNumTotal,
            partyMemberNumCurrent: e.partyMemberNumCurrent,
            partyAddr: e.partyAddr,
            partyAddrDetail: e.partyAddrDetail,
            partyStatus: e.partyStatus,
            itemLink: e.itemLink,
            totalAmount: e.totalAmount)
        );
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: Text(partyList[0].partyTitle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PartyDetailScreen(party: partyList[0])),
              );
            },
          )
          // for (var party in partyList)
          //   ElevatedButton(
          //     child: Text(party.partyTitle),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => PartyDetailScreen(party: party)),
          //       );
          //     },
          //   )
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class PartyDetailScreen extends StatefulWidget {
  final Party? party;
  PartyDetailScreen({
    this.party,
  }) : super(key: ValueKey(party));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${party!.partySeq} Party Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class Party {
  int partySeq;
  int userSeq;
  String partyTitle;
  String partyContent;
  List<dynamic> partyRegDt;
  List<dynamic> partyUpdDt;
  List<dynamic> partyRdvDt;
  String partyRdvLat;
  String partyRdvLng;
  int partyMemberNumTotal;
  int partyMemberNumCurrent;
  String partyAddr;
  String partyAddrDetail;
  int partyStatus;
  String itemLink;
  String totalAmount;
  Party({
    required this.partySeq,
    required this.userSeq,
    required this.partyTitle,
    required this.partyContent,
    required this.partyRegDt,
    required this.partyUpdDt,
    required this.partyRdvDt,
    required this.partyRdvLat,
    required this.partyRdvLng,
    required this.partyMemberNumTotal,
    required this.partyMemberNumCurrent,
    required this.partyAddr,
    required this.partyAddrDetail,
    required this.partyStatus,
    required this.itemLink,
    required this.totalAmount
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      partySeq: json['partySeq'],
      userSeq: json['userSeq'],
      partyTitle: json['partyTitle'],
      partyContent: json['partyContent'],
      partyRegDt: json['partyRegDt'],
      partyUpdDt: json['partyUpdDt'],
      partyRdvDt: json['partyRdvDt'],
      partyRdvLat: json['partyRdvLat'],
      partyRdvLng: json['partyRdvLng'],
      partyMemberNumTotal: json['partyMemberNumTotal'],
      partyMemberNumCurrent: json['partyMemberNumCurrent'],
      partyAddr: json['partyAddr'],
      partyAddrDetail: json['partyAddrDetail'],
      partyStatus: json['partyStatus'],
      itemLink: json['itemLink'],
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partySeq'] = this.partySeq;
    data['userSeq'] = this.userSeq;
    data['partyTitle'] = this.partyTitle;
    data['partyContent'] = this.partyContent;
    data['partyRegDt'] = this.partyRegDt;
    data['partyUpdDt'] = this.partyUpdDt;
    data['partyRdvDt'] = this.partyRdvDt;
    data['partyRdvLat'] = this.partyRdvLat;
    data['partyRdvLng'] = this.partyRdvLng;
    data['partyMemberNumTotal'] = this.partyMemberNumTotal;
    data['partyMemberNumCurrent'] = this.partyMemberNumCurrent;
    data['partyAddr'] = this.partyAddr;
    data['partyAddrDetail'] = this.partyAddrDetail;
    data['partyStatus'] = this.partyStatus;
    data['itemLink'] = this.itemLink;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}