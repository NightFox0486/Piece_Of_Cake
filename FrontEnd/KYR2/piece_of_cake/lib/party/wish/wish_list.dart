import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/kakao_login_model.dart';
import '../../models/party_model.dart';
import '../../notice.dart';
import '../../search.dart';
import 'package:piece_of_cake/widget.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    print('wish list');
    final userProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    final _wishList = partyProvider.wishPartyList;
    print(_wishList);
    return Scaffold(
      appBar: AppBar(
          title: Text('WishList'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notice()),
                  );
                },
                icon: Icon(Icons.notifications)
            ),
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: customSearch()
                  );
                },
                icon: Icon(Icons.search))
          ]
      ),
      body: ListView(
          children: [
            for (var wish in _wishList)
              Item(wish),
            Container(
              margin: EdgeInsets.only(bottom: 50),
            )
          ]
      ),
    );
  }
}