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
          title: const Text('만남의 장소 선택'),),
        body : MapScreen(),
      )
    );
  }
}