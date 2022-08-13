import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';
import 'package:piece_of_cake/models/party_model.dart';
import 'package:piece_of_cake/notice.dart';
import 'package:piece_of_cake/search.dart';
import 'package:piece_of_cake/widget.dart';

class BookmarkList extends StatefulWidget {
  const BookmarkList({Key? key}) : super(key: key);

  @override
  State<BookmarkList> createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  @override
  Widget build(BuildContext context) {
    print('bookmark list');
    final userProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    partyProvider.fetchBookmarkPartyList(userProvider.userResVO!.userSeq);
    final _bookmarkPartyList = partyProvider.bookmarkPartyList;
    print(_bookmarkPartyList);
    return Scaffold(
      appBar: AppBar(
          title: Text('Bookmark List'),
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
            for (var bookmark in _bookmarkPartyList)
              Item(bookmark),
            Container(
              margin: EdgeInsets.only(bottom: 50),
            )
          ]
      ),
    );
  }
}