import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const PartiesApp());
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

  Party(
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
      );

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

class PartiesApp extends StatefulWidget {
  const PartiesApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PartiesAppState();
}

class _PartiesAppState extends State<PartiesApp> {
  final PartyRouterDelegate _routerDelegate = PartyRouterDelegate();
  final PartyRouteInformationParser _routeInformationParser =
  PartyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Parties App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
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
      return RouteInformation(location: '/parties/${configuration.id}');
    }
    return null;
  }
}

class PartyRouterDelegate extends RouterDelegate<PartyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PartyRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Party? _selectedParty;

  List<Party> parties = [
    Party(1, 1, "a", "b", "2022-08-03 12:22:33", "2022-08-03 12:22:33", "2022-08-03 12:22:33", "111", "111", 3, 2, "aa", "bb", 0, "ababab", "1234"),
    Party(2, 2, "c", "d", "2022-08-04 12:22:44", "2022-08-04 12:22:44", "2022-08-04 12:22:44", "222", "222", 4, 3, "cc", "dd", 0, "cdcdcd", "2345"),
    Party(3, 3, "e", "f", "2022-08-05 12:22:55", "2022-08-05 12:22:55", "2022-08-05 12:22:55", "333", "333", 5, 4, "ee", "ff", 0, "efefef", "3456"),
  ];

  PartyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  PartyRoutePath get currentConfiguration => _selectedParty == null
      ? PartyRoutePath.home()
      : PartyRoutePath.details(parties.indexOf(_selectedParty!));

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,

      pages: [
        MaterialPage(
          key: const ValueKey('PartiesListPage'),
          child: PartiesListScreen(
            parties: parties,
            onTapped: _handlePartyTapped,
          ),
        ),
        if (_selectedParty != null) PartyDetailsPage(party: _selectedParty)
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
      _selectedParty = parties[configuration.id!];
    }
  }

  void _handlePartyTapped(Party party) {
    _selectedParty = party;
    notifyListeners();
  }
}

class PartyDetailsPage extends Page {
  final Party? party;

  PartyDetailsPage({
    this.party,
  }) : super(key: ValueKey(party));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PartyDetailsScreen(party: party);
      },
    );
  }
}

class PartyRoutePath {
  final int? id;

  PartyRoutePath.home() : id = null;

  PartyRoutePath.details(this.id);

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class PartiesListScreen extends StatelessWidget {
  final List<Party> parties;
  final ValueChanged<Party> onTapped;

  const PartiesListScreen({Key? key,
    required this.parties,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var party in parties)
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

class PartyDetailsScreen extends StatelessWidget {
  final Party? party;

  const PartyDetailsScreen({Key? key,
    required this.party,
  }) : super(key: key);

  final url = 'http://localhost:9090';
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

// class Session {
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   };
//   Map<String, String> cookies = {};
//   Future<dynamic> get(String url) async {
//     print('get() url: $url');
//     http.Response response = await http.get(Uri.encodeFull(url), headers: headers);
//     final int statusCode = response.statusCode;
//     if (statusCode<200 || statusCode>400 || json==null) {
//       // 코드 입력
//     }
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
//   Future<dynamic> post(String url, dynamic data) async {
//     print('post() url: $url');
//     http.Response response = await http.post(Uri.encodeFull(url), body: json.encode(data), headers: headers);
//     final int statusCode = response.statusCode;
//     if (statusCode<200 || statusCode>400 || json==null) {
//       // 코드 입력
//     }
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
// }