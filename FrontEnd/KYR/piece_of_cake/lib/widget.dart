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
  Party? _party;
  Item(party) {
    _party = party;
  }
  @override
  State<Item> createState() => _ItemState(_party);
}

class _ItemState extends State<Item> {
  Party? _party;
  _ItemState(party) {
    _party = party;
  }
  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    final partyProvider = Provider.of<PartyModel>(context);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
    var bookmarkList = partyProvider.bookmarkList;
    print('bookmarkList: ${bookmarkList}');
    print('partySeq: ${_party!.partySeq}, bookmarkList.contains(_party!.partySeq): ${bookmarkList.contains(_party!.partySeq)}');
    print('partySeq.runtimeType: ${_party!.partySeq.runtimeType}');
    print('bookmarkList[0].runtimeType: ${bookmarkList[0].runtimeType}');
    var isFavorite = bookmarkList.contains(_party!.partySeq) ? true : false;
    BookmarkReqVO bookmarkReqVO = BookmarkReqVO(userSeq: kakaoUserProvider.userResVO!.userSeq, partySeq: _party!.partySeq);
    var bookmarkCount = _party!.partyBookmarkCount;
    Future insertBookmark() async {
      await partyProvider.insertBookmark(bookmarkReqVO);
      await partyProvider.afterBookmark(bookmarkReqVO);
      bookmarkList = partyProvider.bookmarkList;
      await partyProvider.detailBookmark(bookmarkReqVO);
      // Future.microtask(() => _party = _party);
      _party = partyProvider.currentParty;
    }
    Future deleteBookmark() async{
      await partyProvider.deleteBookmark(bookmarkReqVO);
      await partyProvider.afterBookmark(bookmarkReqVO);
      bookmarkList = partyProvider.bookmarkList;
      await partyProvider.detailBookmark(bookmarkReqVO);
      // Future.microtask(() => _party = _party);
      _party = partyProvider.currentParty;
    }
    void setBookmarkCountPlus() {
      bookmarkCount += 1;
    }
    void setBookmarkCountMinus() {
      bookmarkCount -= 1;
    }
    void setBookmarkCount() {
      bookmarkCount = _party!.partyBookmarkCount;
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${_party?.partyTitle}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),overflow: TextOverflow.ellipsis,),
                          Text('${_party?.partyAddr}', style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
                          Text('${_party?.partyContent}', style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LikeButton(
                                  onTap: onLikeButtonTapped,
                                  bubblesSize: 0,
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: Colors.deepPurpleAccent,
                                      size: 20,
                                    );
                                  },
                                  isLiked: isFavorite ? true : false,
                                  likeCount: _party!.partyBookmarkCount,

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
          switch (_party!.partyCode) {
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

// class Item extends StatelessWidget {
//   // const Item({Key? key}) : super(key: key);
//   Party? _party;
//   Item(Party party, {Key? key}) : super(key: key) {
//     _party = party;
//   }
//   var isFavorite = false;
//   var bookmarkList = [];
//   @override
//   Widget build(BuildContext context) {
//     final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
//     final partyProvider = Provider.of<PartyModel>(context);
//     partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
//     bookmarkList = partyProvider.bookmarkList;
//     print('bookmarkList: ${bookmarkList}');
//     print('partySeq: ${_party!.partySeq}, bookmarkList.contains(_party!.partySeq): ${bookmarkList.contains(_party!.partySeq)}');
//     print('partySeq.runtimeType: ${_party!.partySeq.runtimeType}');
//     print('bookmarkList[0].runtimeType: ${bookmarkList[0].runtimeType}');
//     if (bookmarkList.contains(_party!.partySeq)) isFavorite = true;
//     BookmarkReqVO bookmarkReqVO = BookmarkReqVO(userSeq: kakaoUserProvider.userResVO!.userSeq, partySeq: _party!.partySeq);
//     void insertBookmark() {
//       partyProvider.insertBookmark(bookmarkReqVO);
//       partyProvider.afterBookmark(bookmarkReqVO);
//       // _party = partyProvider.detailBookmark(bookmarkReqVO) as Party;
//       _party = partyProvider.currentParty;
//       Future.microtask(() => _party = _party);
//     }
//     void deleteBookmark() {
//       partyProvider.deleteBookmark(bookmarkReqVO);
//       partyProvider.afterBookmark(bookmarkReqVO);
//       // _party = partyProvider.detailBookmark(bookmarkReqVO) as Party;
//       _party = partyProvider.currentParty;
//       Future.microtask(() => _party = _party);
//     }
//     // final partyCode = '001';
//     return InkWell(
//         splashColor: Colors.amber,
//         hoverColor: Colors.lightGreenAccent,
//         highlightColor: Colors.amber,
//         child: Container(
//             height: 156,
//             margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(20)
//             ),
//             child: Row(
//                 children: [
//                   Flexible(flex: 4, child:
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.asset(
//                       'assets/images/harry.png',
//                       fit: BoxFit.fill,
//                     ), // Text(key['title']),
//                   ),
//                   ),
//                   Flexible(flex: 6,child: Container(
//                       margin: EdgeInsets.all(5),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('${_party?.partyTitle}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),overflow: TextOverflow.ellipsis,),
//                           Text('${_party?.partyAddr}', style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
//                           Text('${_party?.partyContent}', style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 IconButton(
//                                     icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
//                                     color: Colors.pink,
//                                     onPressed: () {
//                                       isFavorite ? deleteBookmark : insertBookmark;
//
//                                     },  // LikeButton(),
//                                 ),
//                                 Text('${_party!.partyBookmarkCount}'),
//                               ]
//                           )
//                         ],
//                       )
//                   ),
//                   )
//                 ]
//             )
//         ),
//         onTap: () {
//           switch (_party!.partyCode) {
//             case '001':
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PieDetail()),
//               );
//               break;
//             case '002':
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => BuyDetail()),
//               );
//               break;
//             case '003':
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DlvDetail()),
//               );
//               break;
//           }
//         }
//     );
//   }
// }

