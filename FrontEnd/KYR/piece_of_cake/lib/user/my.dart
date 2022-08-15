import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';
import 'package:provider/provider.dart';
import '../models/party_model.dart';
import '../notice.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../party/buy/buy_detail_host.dart';
import '../party/dlv/dlv_detail.dart';
import '../party/pie/pie_detail.dart';
import '../vo.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  final kakaoLoginModel = KakaoLoginModel();
  
  @override
  Widget build(BuildContext context) {
    print('my page');
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    partyProvider.fetchPartyGuestList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchPartyHostList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
    var _partyGuestList = partyProvider.partyGuestList;
    var _partyHostList = partyProvider.partyHostList;
    var _bookmarkPartyList = partyProvider.bookmarkPartyList;
    var _bookmarkList = partyProvider.bookmarkList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
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
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
                borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.profile?.nickname ?? '',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.profile?.profileImageUrl ?? '',
                              placeholder: (context, url) => new CircularProgressIndicator(),
                              errorWidget: (context, url, error) => new Icon(Icons.error, size: 100,),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    margin: EdgeInsets.all(20),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text('당신은,,', style: TextStyle(fontSize: 20),),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          SfLinearGauge(
                              markerPointers: [
                                // todo: rating point => value
                                LinearShapePointer(value: 70, height: 25, width: 25, color: Colors.amber,)
                              ],
                              showTicks: false,
                              axisTrackStyle: LinearAxisTrackStyle(
                                  thickness: 15,
                                  gradient: LinearGradient(
                                      colors: [Colors.purple, Colors.blue],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0.1, 0.5],
                                      tileMode: TileMode.clamp
                                  )
                              )
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          // >=70 위대한 갯츠비
                          // >=30 아모르 파티너
                          // 뉴비 환영
                          // 시작은 50점
                          // todo: user.rating -> 삼항연산자
                          Text('파티를 즐길 줄 아는 파티왕?!', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    )
                ),
              ]),
            ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Text("파티 참여 내역"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          // 파티 참여 내역
          for (var party in _partyGuestList)
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              hoverColor: Colors.pink,
              highlightColor: Colors.amber,
              child: Container(
                height: 146,
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
                      MaterialPageRoute(builder: (context) => PieDetail(partyResVO: party,)),
                    );
                    break;
                  case '002':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyDetail(partyResVO: party,)),
                    );
                    break;
                  case '003':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DlvDetail(partyResVO: party,)),
                    );
                    break;
                }
              },
            ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Text("파티 개설 내역"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          // 파티 개설 내역
          for (var party in _partyHostList)
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              hoverColor: Colors.pink,
              highlightColor: Colors.amber,
              child: Container(
                height: 146,
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
                      MaterialPageRoute(builder: (context) => PieDetail(partyResVO: party,)),
                    );
                    break;
                  case '002':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyDetail(partyResVO: party,)),
                    );
                    break;
                  case '003':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DlvDetail(partyResVO: party,)),
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