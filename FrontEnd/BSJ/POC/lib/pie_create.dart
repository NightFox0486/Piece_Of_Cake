import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/image_upload_widget.dart';

class PieCreate extends StatelessWidget {
  const PieCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PieCreate')),
      body: ListView(children: [
        Text('test'),
        Container(
          // height: 140,
          child: Center(
            child: ImageUploadWidget(),
          ),
        ),
        Text('test')
      ]),
    );
  }
}
