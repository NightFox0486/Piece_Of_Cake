import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Party> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://localhost:9090/party/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Party.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Party {
  int? partySeq;
  int? userSeq;
  String? partyTitle;
  String? partyContent;
  String? partyRegDt;
  String? partyUpdDt;
  String? partyRdvDt;
  String? partyRdvLat;
  String? partyRdvLng;
  int? partyMemberNumTotal;
  int? partyMemberNumCurrent;
  String? partyAddr;
  String? partyAddrDetail;
  int? partyStatus;
  String? itemLink;
  String? totalAmount;
  Party({
    this.partySeq,
    this.userSeq,
    this.partyTitle,
    this.partyContent,
    this.partyRegDt,
    this.partyUpdDt,
    this.partyRdvDt,
    this.partyRdvLat,
    this.partyRdvLng,
    this.partyMemberNumTotal,
    this.partyMemberNumCurrent,
    this.partyAddr,
    this.partyAddrDetail,
    this.partyStatus,
    this.itemLink,
    this.totalAmount
  });

  Party.fromJson(Map<String, dynamic> json) {
    partySeq = json['partySeq'];
    userSeq = json['userSeq'];
    partyTitle = json['partyTitle'];
    partyContent = json['partyContent'];
    partyRegDt = json['partyRegDt'];
    partyUpdDt = json['partyUpdDt'];
    partyRdvDt = json['partyRdvDt'];
    partyRdvLat = json['partyRdvLat'];
    partyRdvLng = json['partyRdvLng'];
    partyMemberNumTotal = json['partyMemberNumTotal'];
    partyMemberNumCurrent = json['partyMemberNumCurrent'];
    partyAddr = json['partyAddr'];
    partyAddrDetail = json['partyAddrDetail'];
    partyStatus = json['partyStatus'];
    itemLink = json['itemLink'];
    totalAmount = json['totalAmount'];
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
    futureAlbum = fetchAlbum();
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
              if (snapshot.hasData) {
                return Text(snapshot.data!.partyTitle.toString());
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