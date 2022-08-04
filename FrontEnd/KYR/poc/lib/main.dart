import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class Item extends StatelessWidget {
  // Item({Key? key}) : super(key: key);
  final Party? party;
  Item({
    this.party,
  }) : super(key: ValueKey(party));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Flexible(flex: 3, child: Image.asset('images/harry.png', width: 150)),
          Flexible(flex: 7,child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("title: "+party!.partyTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Text("content: "+party!.partyContent, style: TextStyle(fontSize: 15),),
                  Text("total amount: "+party!.totalAmount, style: TextStyle(fontSize: 20)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text('4'),
                      ]
                  )
                ],
              )
          ),
          )
        ],
      ),
    );
  }
}


// class MeApp extends StatelessWidget {
//   const MeApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar( title: TextField(
//                 decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     label: Icon(Icons.search)
//                 )
//             ), actions: [Icon(Icons.menu), Icon(Icons.notifications) ]),
//             body: ListView(
//               children: [
//                 Item(),
//                 Item(),
//                 Item(),
//               ],
//
//             )
//         )
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'CongNamul',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int index = 2;

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
    final items = <Widget>[
      Icon(Icons.home, size:30),
      Icon(Icons.celebration, size:30),
      Icon(Icons.add, size:30),
      Icon(Icons.question_answer, size:30),
      Icon(Icons.person, size:30),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('Piece Of Cake'),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: '파티검색',
                        prefixIcon: Icon(Icons.search),)
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              for (var party in partyList)
                ElevatedButton(
                  child: Item(party: party),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PartyDetailScreen(party: party)),
                    );
                  },
                )
            ]),
          ),
        ],

      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        backgroundColor: Colors.white,
        color: Colors.amber,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
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

