import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';
import 'package:provider/provider.dart';
import '../models/party_model.dart';
import '../notice.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../party/buy/buy_detail_guest.dart';
import '../party/buy/buy_detail_host.dart';
import '../party/dlv/dlv_detail_guest.dart';
import '../party/dlv/dlv_detail_host.dart';
import '../party/pie/pie_detail_guest.dart';
import '../party/pie/pie_detail_host.dart';
import '../vo.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  List<Party> partyList = [];
  List<PartyResVO> partyResVOList = [];
  List<int> bookmarkList = [];
  List<Party> bookmarkPartyList = [];
  List<PartyResVO> bookmarkPartyResVOList = [];
  List<Party> partyGuestList = [];
  List<PartyResVO> partyResVOGuestList = [];
  List<Party> partyHostList = [];
  List<PartyResVO> partyResVOHostList = [];

  void setList(kakaoUserProvider, partyProvider) async {
    await partyProvider.fetchPartyList();
    partyResVOList = partyProvider.partyResVOList;
    await partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO.userSeq);
    bookmarkPartyResVOList = partyProvider.bookmarkPartyResVOList;
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO.userSeq);
    bookmarkList = partyProvider.bookmarkList;
    await partyProvider.fetchPartyGuestList(kakaoUserProvider.userResVO.userSeq);
    partyResVOGuestList = partyProvider.partyResVOGuestList;
    await partyProvider.fetchPartyHostList(kakaoUserProvider.userResVO.userSeq);
    partyResVOHostList = partyProvider.partyResVOHostList;
    List<Party> list = [];
    for (PartyResVO partyResVO in partyResVOList) {
      await kakaoUserProvider.setCurrentPartyWriter(partyResVO.userSeq);
      UserResVO userResVO = kakaoUserProvider.currentPartyWriter;
      var party = Party(
          partySeq: partyResVO.partySeq,
          userResVO: userResVO,
          partyCode: partyResVO.partyCode,
          partyTitle: partyResVO.partyTitle,
          partyContent: partyResVO.partyContent,
          partyBookmarkCount: partyResVO.partyBookmarkCount,
          partyRegDt: partyResVO.partyRegDt,
          partyUpdDt: partyResVO.partyUpdDt,
          partyRdvDt: partyResVO.partyRdvDt,
          partyRdvLat: partyResVO.partyRdvLat,
          partyRdvLng: partyResVO.partyRdvLng,
          partyMemberNumTotal: partyResVO.partyMemberNumTotal,
          partyMemberNumCurrent: partyResVO.partyMemberNumCurrent,
          partyAddr: partyResVO.partyAddr,
          partyAddrDetail: partyResVO.partyAddrDetail,
          partyStatus: partyResVO.partyStatus,
          itemLink: partyResVO.itemLink,
          totalAmount: partyResVO.totalAmount,
          partyMainImageUrl: partyResVO.partyMainImageUrl
      );
      // partyList.add(party);
      list.add(party);
    }
    partyList = list;
    list = [];
    for (PartyResVO partyResVO in bookmarkPartyResVOList) {
      await kakaoUserProvider.setCurrentPartyWriter(partyResVO.userSeq);
      UserResVO userResVO = kakaoUserProvider.currentPartyWriter;
      var party = Party(
          partySeq: partyResVO.partySeq,
          userResVO: userResVO,
          partyCode: partyResVO.partyCode,
          partyTitle: partyResVO.partyTitle,
          partyContent: partyResVO.partyContent,
          partyBookmarkCount: partyResVO.partyBookmarkCount,
          partyRegDt: partyResVO.partyRegDt,
          partyUpdDt: partyResVO.partyUpdDt,
          partyRdvDt: partyResVO.partyRdvDt,
          partyRdvLat: partyResVO.partyRdvLat,
          partyRdvLng: partyResVO.partyRdvLng,
          partyMemberNumTotal: partyResVO.partyMemberNumTotal,
          partyMemberNumCurrent: partyResVO.partyMemberNumCurrent,
          partyAddr: partyResVO.partyAddr,
          partyAddrDetail: partyResVO.partyAddrDetail,
          partyStatus: partyResVO.partyStatus,
          itemLink: partyResVO.itemLink,
          totalAmount: partyResVO.totalAmount,
          partyMainImageUrl: partyResVO.partyMainImageUrl
      );
      // bookmarkPartyList.add(party);
      list.add(party);
    }
    bookmarkPartyList = list;
    list = [];
    for (PartyResVO partyResVO in partyResVOGuestList) {
      await kakaoUserProvider.setCurrentPartyWriter(partyResVO.userSeq);
      UserResVO userResVO = kakaoUserProvider.currentPartyWriter;
      var party = Party(
          partySeq: partyResVO.partySeq,
          userResVO: userResVO,
          partyCode: partyResVO.partyCode,
          partyTitle: partyResVO.partyTitle,
          partyContent: partyResVO.partyContent,
          partyBookmarkCount: partyResVO.partyBookmarkCount,
          partyRegDt: partyResVO.partyRegDt,
          partyUpdDt: partyResVO.partyUpdDt,
          partyRdvDt: partyResVO.partyRdvDt,
          partyRdvLat: partyResVO.partyRdvLat,
          partyRdvLng: partyResVO.partyRdvLng,
          partyMemberNumTotal: partyResVO.partyMemberNumTotal,
          partyMemberNumCurrent: partyResVO.partyMemberNumCurrent,
          partyAddr: partyResVO.partyAddr,
          partyAddrDetail: partyResVO.partyAddrDetail,
          partyStatus: partyResVO.partyStatus,
          itemLink: partyResVO.itemLink,
          totalAmount: partyResVO.totalAmount,
          partyMainImageUrl: partyResVO.partyMainImageUrl
      );
      // partyGuestList.add(party);
      list.add(party);
    }
    partyGuestList = list;
    list = [];
    for (PartyResVO partyResVO in partyResVOHostList) {
      await kakaoUserProvider.setCurrentPartyWriter(partyResVO.userSeq);
      UserResVO userResVO = kakaoUserProvider.currentPartyWriter;
      var party = Party(
          partySeq: partyResVO.partySeq,
          userResVO: userResVO,
          partyCode: partyResVO.partyCode,
          partyTitle: partyResVO.partyTitle,
          partyContent: partyResVO.partyContent,
          partyBookmarkCount: partyResVO.partyBookmarkCount,
          partyRegDt: partyResVO.partyRegDt,
          partyUpdDt: partyResVO.partyUpdDt,
          partyRdvDt: partyResVO.partyRdvDt,
          partyRdvLat: partyResVO.partyRdvLat,
          partyRdvLng: partyResVO.partyRdvLng,
          partyMemberNumTotal: partyResVO.partyMemberNumTotal,
          partyMemberNumCurrent: partyResVO.partyMemberNumCurrent,
          partyAddr: partyResVO.partyAddr,
          partyAddrDetail: partyResVO.partyAddrDetail,
          partyStatus: partyResVO.partyStatus,
          itemLink: partyResVO.itemLink,
          totalAmount: partyResVO.totalAmount,
          partyMainImageUrl: partyResVO.partyMainImageUrl
      );
      // partyHostList.add(party);
      list.add(party);
    }
    partyHostList = list;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print('my page');
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    setList(kakaoUserProvider, partyProvider);
    print('rating: ${kakaoUserProvider.userResVO!.userRating}');
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
                              imageUrl: kakaoUserProvider.user?.kakaoAccount?.profile?.profileImageUrl ?? '',
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
                                // LinearShapePointer(value: kakaoUserProvider.userResVO!.userRating!.toDouble(), height: 25, width: 25, color: Colors.amber,)
                                LinearShapePointer(value: kakaoUserProvider.userResVO!.userRating==null ? 50 : kakaoUserProvider.userResVO!.userRating, height: 25, width: 25, color: Colors.amber,)
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
                          Text('${kakaoUserProvider.userResVO!.userRating>=70 ? '위대한 갯츠비' : kakaoUserProvider.userResVO!.userRating>=30 ? '아모르 파티너' : '뉴비 환영'}', style: TextStyle(fontSize: 20)),
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
          for (var party in partyGuestList)
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
                                    bookmarkPartyResVOList = partyProvider.bookmarkPartyResVOList;
                                    bookmarkList = partyProvider.bookmarkList;
                                    setState(() {

                                    });
                                  },
                                  bubblesSize: 0,
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      bookmarkList.contains(party.partySeq) ? Icons.favorite : Icons.favorite_border,
                                      color: Colors.deepPurpleAccent,
                                      size: 20,
                                    );
                                  },
                                  isLiked: bookmarkList.contains(party.partySeq) ? true : false,
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
                // kakaoUserProvider.setCurrentPartyWriter(party.userSeq);
                // var writer = kakaoUserProvider.writer;
                switch (party.partyCode) {
                  case '001':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      kakaoUserProvider.userResVO!.userSeq==party.userResVO.userSeq ?
                      PieDetailHost(party: party,) :
                      PieDetailGuest(party: party,),
                      ),
                    );
                    break;
                  case '002':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      kakaoUserProvider.userResVO!.userSeq==party.userResVO.userSeq ?
                      BuyDetailHost(party: party,) :
                      BuyDetailGuest(party: party,),
                      ),
                    );
                    break;
                  case '003':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      kakaoUserProvider.userResVO!.userSeq==party.userResVO.userSeq ?
                      DlvDetailHost(party: party,) :
                      DlvDetailGuest(party: party,),
                      ),
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
          for (var party in partyHostList)
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
                                    bookmarkPartyResVOList = partyProvider.bookmarkPartyResVOList;
                                    bookmarkList = partyProvider.bookmarkList;
                                    setState(() {

                                    });
                                  },
                                  bubblesSize: 0,
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      bookmarkList.contains(party.partySeq) ? Icons.favorite : Icons.favorite_border,
                                      color: Colors.deepPurpleAccent,
                                      size: 20,
                                    );
                                  },
                                  isLiked: bookmarkList.contains(party.partySeq) ? true : false,
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
                // kakaoUserProvider.setCurrentPartyWriter(party.userSeq);
                // var writer = kakaoUserProvider.writer;
                switch (party.partyCode) {
                  case '001':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      kakaoUserProvider.userResVO!.userSeq==party.userResVO.userSeq ?
                      PieDetailHost(party: party,) :
                      PieDetailGuest(party: party,),
                      ),
                    );
                    break;
                  case '002':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      kakaoUserProvider.userResVO!.userSeq==party.userResVO.userSeq ?
                      BuyDetailHost(party: party,) :
                      BuyDetailGuest(party: party,),
                      ),
                    );
                    break;
                  case '003':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      kakaoUserProvider.userResVO!.userSeq==party.userResVO.userSeq ?
                      DlvDetailHost(party: party,) :
                      DlvDetailGuest(party: party,),
                      ),
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