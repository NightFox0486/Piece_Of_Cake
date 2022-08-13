import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piece_of_cake/party/pie/pie_detail.dart';

import 'package:piece_of_cake/widget.dart';
import 'package:provider/provider.dart';

import '../models/kakao_login_model.dart';
import '../models/party_model.dart';
import '../vo.dart';
import 'buy/buy_detail_host.dart';
import 'dlv/dlv_detail.dart';

class PartyList extends StatefulWidget {
  // const PartyList({Key? key}) : super(key: key);
  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  // GlobalKey<_PartyListState> partyListGlobalKey = GlobalKey();
  // var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    print('party list');
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    partyProvider.fetchPartyList();
    partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
    var _partyList = partyProvider.partyList;
    var _bookmarkPartyList = partyProvider.bookmarkPartyList;
    var _bookmarkList = partyProvider.bookmarkList;
    return Scaffold(
      appBar: AppBar(
          title: Text('Party List'),
      ),

      body: ListView(
        children: [
          for (var party in _partyList)
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
                      MaterialPageRoute(builder: (context) => PieDetail()),
                    );
                    break;
                  case '002':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyDetail()),
                    );
                    break;
                  case '003':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DlvDetail()),
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