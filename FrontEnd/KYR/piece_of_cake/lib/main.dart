import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:piece_of_cake/expandableFAB.dart';
import 'package:provider/provider.dart';
import './my.dart';
import './chat_list_my.dart';
import './pie_create.dart';
import './party_list.dart';
import './home.dart';
import './action-button.dart';
import './dlv_create.dart';
import './buy_create.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'kakao_login_page.dart';
import 'models/kakao_login_model.dart';
import 'models/party_model.dart';



void main() {
  KakaoSdk.init(nativeAppKey: '2157d1da3704b84b219793633746ca5c');
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => KakaoLoginModel()),
          ChangeNotifierProvider(create: (_) => PartyModel()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Piece Of Cake',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const KakaoLoginPage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  // final kakaoLoginViewModel = KakaoLoginViewModel(KakaoLogin());

  int index = 0;
  final screens = [
    Home(),
    PartyList(),
    ChatListMy(),
    My(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size:30),
      Icon(Icons.celebration, size:30),
      Icon(Icons.question_answer, size:30),
      Icon(Icons.person, size:30),

    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        key: navigationKey,
        backgroundColor: Colors.white,
        color: Colors.amber,
        height: 55,
        onTap: (index) => setState(() => this.index = index),
      ),
      // floatingActionButton: ExpandableFab(
      //     distance: 120,
      //     children: [
      //       ElevatedButton.icon(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => DlvCreate()),
      //           );
      //         },
      //         icon: Icon(Icons.delivery_dining),
      //         label: Text('배달')
      //       ),
      //       ElevatedButton.icon(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => BuyCreate()),
      //             );
      //           },
      //           icon: Icon(Icons.shopping_bag),
      //           label: Text('공구')
      //       ),
      //       ElevatedButton.icon(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => PieCreate()),
      //             );
      //           },
      //           icon: Icon(Icons.safety_divider),
      //           label: Text('소분')
      //       ),
      //     ]),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 10,
        overlayOpacity: 0.7,
        curve: Curves.bounceIn,
        backgroundColor: Colors.amber,
        activeBackgroundColor: Colors.redAccent,
        elevation: 16.0,
        children: [
          SpeedDialChild(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DlvCreate()),
              );
            },
            child: Icon(Icons.delivery_dining, size: 30,),
            label: '배달',
            labelStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.amber
          ),
          SpeedDialChild(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyCreate()),
                );
              },
            child: Icon(Icons.shopping_bag, size: 30,),
            label: '공구',
            labelStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.amber
          ),
          SpeedDialChild(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PieCreate()),
                );
              },
            child: Icon(Icons.safety_divider, size: 30,),
            label: '소분',
            labelStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.amber
          ),
        ],
      ),

    );
  }
}




