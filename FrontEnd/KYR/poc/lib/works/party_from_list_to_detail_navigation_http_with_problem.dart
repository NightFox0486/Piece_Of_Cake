import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(PartyListHome());
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

class PartyListHome extends StatefulWidget {
  const PartyListHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PartyListHomeState();
}

class _PartyListHomeState extends State<PartyListHome> {

  final PartyRouterDelegate _routerDelegate = PartyRouterDelegate();
  final PartyRouteInformationParser _routeInformationParser = PartyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'POC',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class PartyRouterDelegate extends RouterDelegate<PartyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PartyRoutePath> {
  late List<Party> partyList = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Party? _selectedParty;

  PartyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  Future<List<Party>> fetchPartyList() async {
    final response = await http.get(Uri.parse('http://localhost:9090/party'));
    if (response.statusCode==200) {
      List<Party> _partyList = (jsonDecode(response.body) as List)
          .map((e) => Party.fromJson(e))
          .toList();
      return _partyList;
    }else {
      throw Exception('Failed to load party list.');
    }
  }

  @override
  PartyRoutePath get currentConfiguration => _selectedParty == null
      ? PartyRoutePath.home()
      : PartyRoutePath.details(partyList.indexOf(_selectedParty!));

  @override
  Widget build(BuildContext context) {
    Future<List<Party>> futurePartyList = fetchPartyList();
    futurePartyList.then((value) {
      value.forEach((element) {
        partyList.add(
          Party(partySeq: element.partySeq,
              userSeq: element.userSeq,
              partyTitle: element.partyTitle,
              partyContent: element.partyContent,
              partyRegDt: element.partyRegDt,
              partyUpdDt: element.partyUpdDt,
              partyRdvDt: element.partyRdvDt,
              partyRdvLat: element.partyRdvLat,
              partyRdvLng: element.partyRdvLng,
              partyMemberNumTotal: element.partyMemberNumTotal,
              partyMemberNumCurrent: element.partyMemberNumCurrent,
              partyAddr: element.partyAddr,
              partyAddrDetail: element.partyAddrDetail,
              partyStatus: element.partyStatus,
              itemLink: element.itemLink,
              totalAmount: element.totalAmount)
        );
      });
    });
    return Navigator(
      key: navigatorKey,

      pages: [
        MaterialPage(
          key: const ValueKey('Party List Page'),
          child: PartyListScreen(
            partyList: partyList,
            onTapped: _handlePartyTapped,
          ),
        ),
        if (_selectedParty != null) PartyDetailPage(party: _selectedParty)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedParty = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PartyRoutePath configuration) async {
    if (configuration.isDetailsPage) {
      _selectedParty = partyList[configuration.id!];
    }
  }

  void _handlePartyTapped(Party party) {
    _selectedParty = party;
    notifyListeners();
  }
}

class PartyRouteInformationParser extends RouteInformationParser<PartyRoutePath> {
  @override
  Future<PartyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return PartyRoutePath.details(int.tryParse(remaining));
    } else {
      return PartyRoutePath.home();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PartyRoutePath configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: '/party/${configuration.id}');
    }
    return null;
  }
}



class PartyRoutePath {
  final int? id;

  PartyRoutePath.home() : id = null;

  PartyRoutePath.details(this.id);

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class PartyListScreen extends StatelessWidget {
  final List<Party> partyList;
  final ValueChanged<Party> onTapped;

  const PartyListScreen({Key? key,
    required this.partyList,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var party in partyList)
            ListTile(
              title: Text(party.partyTitle.toString()),
              subtitle: Text(party.partyContent.toString()),
              onTap: () => onTapped(party),
            )
        ],
      ),
    );
  }
}

class PartyDetailPage extends Page {
  final Party? party;

  PartyDetailPage({
    this.party,
  }) : super(key: ValueKey(party));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PartyDetailScreen(party: party);
      },
    );
  }
}

class PartyDetailScreen extends StatelessWidget {
  final Party? party;

  const PartyDetailScreen({Key? key,
    required this.party,
  }) : super(key: key);

  // final url = 'http://localhost:9090';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (party != null) ...[
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