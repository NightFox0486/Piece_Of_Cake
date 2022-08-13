import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piece_of_cake/party/party_list.dart';

import 'package:piece_of_cake/party/pie/pie_detail.dart';
import 'package:piece_of_cake/party/buy/buy_detail_guest.dart';
import 'package:piece_of_cake/party/buy/buy_detail_host.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail.dart';
import 'package:piece_of_cake/vo.dart';
import 'package:provider/provider.dart';

import 'models/kakao_login_model.dart';
import 'models/party_model.dart';

class Item extends StatefulWidget {
  // Party? _party;
  // Item(party) {
  //   _party = party;
  // }
  final Function() onTap;
  Party party;
  Item({Key? key, required this.party, required this.onTap}) : super(key: key);

  @override
  // State<Item> createState() => _ItemState(_party);
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    final partyProvider = Provider.of<PartyModel>(context);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
    var bookmarkList = partyProvider.bookmarkList;
    print('bookmarkList: ${bookmarkList}');
    print('partySeq: ${widget.party.partySeq}, bookmarkList.contains(_party!.partySeq): ${bookmarkList.contains(widget.party.partySeq)}');
    print('partySeq.runtimeType: ${widget.party.partySeq.runtimeType}');
    print('bookmarkList[0].runtimeType: ${bookmarkList[0].runtimeType}');
    var isFavorite = bookmarkList.contains(widget.party.partySeq) ? true : false;
    BookmarkReqVO bookmarkReqVO = BookmarkReqVO(userSeq: kakaoUserProvider.userResVO!.userSeq, partySeq: widget.party.partySeq);
    var bookmarkCount = widget.party.partyBookmarkCount;
    Future insertBookmark() async {
      await partyProvider.insertBookmark(bookmarkReqVO);
      await partyProvider.afterBookmark(bookmarkReqVO);
      bookmarkList = partyProvider.bookmarkList;
    }
    Future deleteBookmark() async{
      await partyProvider.deleteBookmark(bookmarkReqVO);
      await partyProvider.afterBookmark(bookmarkReqVO);
      bookmarkList = partyProvider.bookmarkList;
    }
    void setBookmarkCountPlus() {
      bookmarkCount += 1;
    }
    void setBookmarkCountMinus() {
      bookmarkCount -= 1;
    }
    void setBookmarkCount() {
      bookmarkCount = widget.party.partyBookmarkCount;
    }
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      if (isLiked) {
        deleteBookmark();
        setBookmarkCountMinus();
      }else {
        setBookmarkCountPlus();
        insertBookmark();
      }
      isFavorite = !isFavorite;
      // setState(() {
      // });
      return !isLiked;
    }
    return InkWell(
        splashColor: Colors.amber,
        hoverColor: Colors.lightGreenAccent,
        highlightColor: Colors.amber,
        // child: Container(
        child: Container(
            height: 156,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
                children: [
                  Flexible(flex: 4, child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/harry.png',
                      fit: BoxFit.fill,
                    ), // Text(key['title']),
                  ),
                  ),
                  Flexible(flex: 6,child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                      // child: Wrap(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.party.partyTitle}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),overflow: TextOverflow.ellipsis,),
                          Text('${widget.party.partyAddr}', style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
                          Text('${widget.party.partyContent}', style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LikeButton(
                                  onTap: onLikeButtonTapped,
                                  bubblesSize: 0,
                                  likeBuilder: (bool isLiked) {
                                    widget.onTap();
                                    return Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: Colors.deepPurpleAccent,
                                      size: 20,
                                    );
                                  },
                                  isLiked: isFavorite ? true : false,
                                  likeCount: widget.party.partyBookmarkCount,

                                )
                                // IconButton(
                                //     icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                                //     color: Colors.pink,
                                //     // onPressed: isFavorite ? deleteBookmark : insertBookmark;
                                //     onPressed: () {
                                //       if (isFavorite) {
                                //         deleteBookmark();
                                //       } else {
                                //         insertBookmark();
                                //       }
                                //       setState(() {
                                //         bookmarkList = partyProvider.bookmarkList;
                                //         if (isFavorite) {
                                //           // setBookmarkCountMinus();
                                //           bookmarkCount-=1;
                                //         }else {
                                //           // setBookmarkCountPlus();
                                //           bookmarkCount+=1;
                                //         }
                                //         isFavorite = !isFavorite;
                                //         // Navigator.pushReplacement(
                                //         //   context,
                                //         //   MaterialPageRoute(
                                //         //     builder: (BuildContext context) => super.widget
                                //         //   )
                                //         // );
                                //       });
                                //     },  // LikeButton(),
                                // ),
                                // Text('${bookmarkCount}'),
                              ]
                          )
                        ],
                      )
                  ),
                  )
                ]
            )
        ),
        onTap: () {
          switch (widget.party.partyCode) {
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
        }
    );
  }
}
