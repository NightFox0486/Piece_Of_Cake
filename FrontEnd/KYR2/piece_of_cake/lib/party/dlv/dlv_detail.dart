import 'package:flutter/material.dart';

class DlvDetail extends StatelessWidget {
  const DlvDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dlv Detail'),
      ),
      body: SizedBox(
        child: Text('This is a dlv detail page.'),
      ),
    );
  }
}
