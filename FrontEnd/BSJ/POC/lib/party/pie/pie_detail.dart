import 'package:flutter/material.dart';

class PieDetail extends StatelessWidget {
  const PieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Detail'),
      ),
      body: SizedBox(
        child: Text('This is a pie detail page.'),
      ),
    );
  }
}
