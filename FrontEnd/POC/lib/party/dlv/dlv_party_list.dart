import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail_host.dart';
import 'package:piece_of_cake/party/pie/pie_detail_guest.dart';
import 'package:piece_of_cake/party/pie/pie_detail_host.dart';

import 'package:provider/provider.dart';

import '../../models/kakao_login_model.dart';
import '../../models/party_model.dart';
import '../../vo.dart';
import '../buy/buy_detail_guest.dart';
import '../buy/buy_detail_host.dart';
import '../dlv/dlv_detail_guest.dart';


class DlvPartyList extends StatefulWidget {
  @override
  State<DlvPartyList> createState() => _DlvPartyListState();
}

class _DlvPartyListState extends State<DlvPartyList> {
  List<Party> dlvPartyList = [];
  List<PartyResVO> dlvPartyResVOList = [];
  List<int> bookmarkList = [];
  List<Party> bookmarkPartyList = [];
  List<PartyResVO> bookmarkPartyResVOList = [];

  void setList(kakaoUserProvider, partyProvider) async {
    await partyProvider.fetchDlvPartyList();
    dlvPartyResVOList = partyProvider.dlvPartyResVOList;
    await partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO.userSeq);
    bookmarkPartyResVOList = partyProvider.bookmarkPartyResVOList;
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO.userSeq);
    bookmarkList = partyProvider.bookmarkList;
    List<Party> list = [];
    for (PartyResVO partyResVO in dlvPartyResVOList) {
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
    dlvPartyList = list;
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

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    setList(kakaoUserProvider, partyProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dlv Party List'),
      ),
      body: ListView(
        children: [
          for (var party in dlvPartyList)
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
                        child: CachedNetworkImage(
                          imageUrl: party.partyMainImageUrl,
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error, size: 100,),
                          fit: BoxFit.fill,
                          width: 180,
                          height: 180,
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