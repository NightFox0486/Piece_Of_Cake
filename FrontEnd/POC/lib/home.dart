import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';
import 'package:piece_of_cake/models/party_model.dart';
import 'package:piece_of_cake/party/buy/buy_detail_guest.dart';
import 'package:piece_of_cake/party/buy/buy_detail_host.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail_guest.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail_host.dart';
import 'package:piece_of_cake/party/party_list.dart';
import 'package:piece_of_cake/party/pie/pie_detail_guest.dart';
import 'package:piece_of_cake/party/pie/pie_detail_host.dart';
import 'package:piece_of_cake/vo.dart';
import 'package:provider/provider.dart';
import 'user/my.dart';
import 'chat/chat_list_my.dart';
import 'party/pie/pie_create.dart';
import 'party/bookmark/bookmark_list.dart';
import './notice.dart';
import './search.dart';
import 'package:piece_of_cake/widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Party> partyList = [];
  List<PartyResVO> partyResVOList = [];
  List<int> bookmarkList = [];
  List<Party> bookmarkPartyList = [];
  List<PartyResVO> bookmarkPartyResVOList = [];
  List<Party> latestPartyList = [];
  List<PartyResVO> latestPartyResVOList = [];

  void setList(kakaoUserProvider, partyProvider) async {
    await partyProvider.fetchPartyList();
    partyResVOList = partyProvider.partyResVOList;
    await partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO.userSeq);
    bookmarkPartyResVOList = partyProvider.bookmarkPartyResVOList;
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO.userSeq);
    bookmarkList = partyProvider.bookmarkList;
    await partyProvider.fetchLatestPartyList();
    latestPartyResVOList = partyProvider.latestPartyResVOList;
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
    for (PartyResVO partyResVO in latestPartyResVOList) {
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
      // latestPartyList.add(party);
      list.add(party);
    }
    latestPartyList = list;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    var partyProvider = Provider.of<PartyModel>(context);
    setList(kakaoUserProvider, partyProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text('Piece Of Cake'),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => gps()),
                  // );
                },
                icon: Icon(Icons.my_location)
            ),
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
                icon: Icon(Icons.search)),
          ]
      ),
      body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('최신 파티',
                    style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10),
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var party in latestPartyList)
                          buildCard(kakaoUserProvider, party),
                        SizedBox(width:12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(5)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('전체', style: TextStyle(fontSize: 20),)
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('소분', style: TextStyle(fontSize: 20),)
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('공구', style: TextStyle(fontSize: 20),)
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('배달', style: TextStyle(fontSize: 20),)
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.all(5)
            ),
          ]
      ),
    );
  }
  Widget buildCard(kakaoUserProvider, Party party) => InkWell(
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
    child: Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: party.partyMainImageUrl,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error, size: 100,),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${party.partyTitle}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          Text(
            '${int.parse(party.totalAmount)==0 ? 0 : (int.parse(party.totalAmount)/party.partyMemberNumTotal).ceil()}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],


      ),
    ),
  );
}
