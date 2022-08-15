import 'package:flutter/material.dart';

import '../../vo.dart';

class PieDetail extends StatefulWidget {
  final PartyResVO partyResVO;
  const PieDetail(
      {Key? key, required this.partyResVO})
      : super(key: key
  );
  @override
  State<PieDetail> createState() => _PieDetailState();
}

class _PieDetailState extends State<PieDetail> {
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
