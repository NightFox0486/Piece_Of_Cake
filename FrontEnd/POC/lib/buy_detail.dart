import 'package:flutter/material.dart';
import 'package:piece_of_cake/buy_create.dart';

class BuyDetail extends StatefulWidget {
  const BuyDetail({Key? key}) : super(key: key);

  @override
  State<BuyDetail> createState() => _BuyDetailState();
}

class _BuyDetailState extends State<BuyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BuyDetail'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyCreate()),
                );
              },
            ),
          ],
      ),
    );
  }
}
