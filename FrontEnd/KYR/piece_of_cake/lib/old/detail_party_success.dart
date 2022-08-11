import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Party> fetchParty() async {
  final response = await http
      .get(Uri.parse('http://localhost:9090/party/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('fetchParty() called');
    print(Party.fromJson(jsonDecode(response.body)));
    return Party.fromJson(jsonDecode(response.body));
    // return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Party {
  final int partySeq;
  final int userSeq;
  final String partyTitle;
  final String partyContent;
  final List<dynamic> partyRegDt;
  final List<dynamic> partyUpdDt;
  final List<dynamic> partyRdvDt;
  final String partyRdvLat;
  final String partyRdvLng;
  final int partyMemberNumTotal;
  final int partyMemberNumCurrent;
  final String partyAddr;
  final String partyAddrDetail;
  final int partyStatus;
  final String itemLink;
  final String totalAmount;
  const Party({
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
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Party> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchParty();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Party>(
            future: futureAlbum,
            builder: (context, snapshot) {
              // print(snapshot);
              if (snapshot.hasData) {
                return Text(snapshot.data!.partyTitle);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}