
import 'package:flutter/material.dart';
import 'package:common_pjt/map_screen.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('랑데부 포인트를 선택해 주세요'),),
        body : MapScreen(),
      )
    );
  }
}