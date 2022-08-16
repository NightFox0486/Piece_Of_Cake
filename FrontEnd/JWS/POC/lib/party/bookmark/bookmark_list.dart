import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piece_of_cake/party/buy/buy_detail_host.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail_guest.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail_host.dart';
import 'package:piece_of_cake/party/pie/pie_detail_guest.dart';
import 'package:piece_of_cake/party/pie/pie_detail_host.dart';
import 'package:piece_of_cake/vo.dart';
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
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
    var _bookmarkPartyList = partyProvider.bookmarkPartyList;
    var _bookmarkList = partyProvider.bookmarkList;
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
          for (var party in _bookmarkPartyList)
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              hoverColor: Colors.pink,
              highlightColor: Colors.amber,
              child: Container(
                height: 156,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink), borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/harry.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${party.partyTitle}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),overflow: TextOverflow.ellipsis,),
                            Text('${party.partyAddr}', style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
                            Text('${party.partyContent}', style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LikeButton(
                                  onTap: (bool isLiked) async {
                                    var bookmarkReqVO = BookmarkReqVO(
                                      userSeq: kakaoUserProvider.userResVO!.userSeq,
                                      partySeq: party.partySeq,
                                    );
                                    if (isLiked) {
                                      // todo: delete bookmark
                                      await partyProvider.deleteBookmark(bookmarkReqVO);
                                    } else {
                                      // todo: insert bookmark
                                      await partyProvider.insertBookmark(bookmarkReqVO);
                                    }
                                    _bookmarkPartyList = partyProvider.bookmarkPartyList;
                                    _bookmarkList = partyProvider.bookmarkList;
                                    setState(() {

                                    });
                                  },
                                  bubblesSize: 0,
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      _bookmarkList.contains(party.partySeq) ? Icons.favorite : Icons.favorite_border,
                                      color: Colors.deepPurpleAccent,
                                      size: 20,
                                    );
                                  },
                                  isLiked: _bookmarkList.contains(party.partySeq) ? true : false,
                                  likeCount: party.partyBookmarkCount,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                switch (party.partyCode) {
                  case '001':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PieDetailHost()),
                    );
                    break;
                  case '002':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyDetailHost()),
                    );
                    break;
                  case '003':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DlvDetailHost()),
                    );
                    break;
                }
              },
            )
        ],
      ),
    );
  }
}
