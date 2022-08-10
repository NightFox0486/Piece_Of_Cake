import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: PartyListScreen(),
  ));
}

class PartyListScreen extends StatelessWidget {
  PartyListScreen({super.key});
  List<Party> partyList = [];
  Future<void> fetchPartyList() async {
    final response = await http.get(Uri.parse('http://localhost:9090/party'));
    if (response.statusCode==200) {
      this.partyList = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => Party.fromJson(e))
          .toList();
      print(partyList);
    }else {
      throw Exception('Failed to load party list.');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchPartyList();
    print(partyList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: ListView(
        children: [
          for (var party in partyList)
            ElevatedButton(
              child: Text(party.partyTitle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PartyDetailScreen(party: party)),
                );
              },
            )
        ],
      ),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}

class PartyDetailScreen extends StatelessWidget {
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
        child: Column(
          children: [
            if (party!=null) ...[
              Text("title: "+party!.partyTitle.toString(), style: Theme.of(context).textTheme.headline6),
              Text("content: "+party!.partyContent.toString(), style: Theme.of(context).textTheme.subtitle1),
              Text("reg date: "+party!.partyRegDt.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("upd date: "+party!.partyUpdDt.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("rdv date: "+party!.partyRdvDt.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("curr member num: "+party!.partyMemberNumCurrent.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("total member num: "+party!.partyMemberNumTotal.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("addr: "+party!.partyAddr.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("addr detail: "+party!.partyAddrDetail.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("status: "+party!.partyStatus.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("item link: "+party!.itemLink.toString(), style: Theme.of(context).textTheme.bodyText1),
              Text("total amount: "+party!.totalAmount.toString(), style: Theme.of(context).textTheme.bodyText1),
            ],
          ],
        ),
      ),
    );
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