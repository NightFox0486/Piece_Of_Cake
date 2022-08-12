import 'package:flutter/material.dart';

import 'package:piece_of_cake/widget.dart';

class PartyList extends StatefulWidget {
  const PartyList({Key? key}) : super(key: key);

  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('PartyList'),
      ),
      body: ListView(
          children: [
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Container(
              margin: EdgeInsets.only(bottom: 50),
            )
          ]
      ),
    );
  }
}