import 'package:flutter/material.dart';

import '../../vo.dart';

class DlvDetail extends StatefulWidget {
  final PartyResVO partyResVO;
  const DlvDetail(
      {Key? key, required this.partyResVO})
      : super(key: key
  );
  @override
  State<DlvDetail> createState() => _DlvDetailState();
}

class _DlvDetailState extends State<DlvDetail> {
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