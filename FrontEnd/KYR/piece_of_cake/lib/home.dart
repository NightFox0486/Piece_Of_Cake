import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/party/party_list.dart';
import 'package:piece_of_cake/vo.dart';
import 'package:provider/provider.dart';
import 'models/kakao_login_model.dart';
import 'models/party_model.dart';
import 'user/my.dart';
import 'chat/chat_list_my.dart';
import 'party/pie/pie_create.dart';
import 'party/bookmark//bookmark_list.dart';
import './notice.dart';
import './search.dart';
import 'package:piece_of_cake/widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final partyProvider = Provider.of<PartyModel>(context);
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    partyProvider.fetchPartyList();
    partyProvider.fetchBookmarkPartyList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchBookmarkList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchPartyGuestList(kakaoUserProvider.userResVO!.userSeq);
    partyProvider.fetchPartyHostList(kakaoUserProvider.userResVO!.userSeq);

    // create party result test
    var partyReqVO = PartyReqVO(
        partyCode: '002',
        partyTitle: 'create test',
        partyContent: '[_HomePageState] partymodel createParty() test',
        partyBookmarkCount: 0,
        partyRdvDt: [22, 1, 1, 1, 1, 1],
        partyRdvLat: '1234',
        partyRdvLng: '1234',
        partyMemberNumTotal: 2,
        partyMemberNumCurrent: 0,
        partyAddr: 'songsam',
        partyAddrDetail: '2층',
        partyStatus: 1,
        itemLink: 'this is item link',
        totalAmount: '20000'
    );
    partyProvider.createParty(partyReqVO, kakaoUserProvider.userResVO!.userSeq);
    return Scaffold(
      appBar: AppBar(
        title: Text('Piece Of Cake'),
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
          Container(
              margin: EdgeInsets.all(5)
          ),
          Column(
            children: [
              Text('최신 파티',
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),),
              // Item(),
            ],
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
          Column(
            children: [
              Text('광고',
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),),
              // Item(),
            ],
          ),
        ]
      ),
    );
  }
}


// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             floating: true,
//             pinned: true,
//             snap: false,
//             centerTitle: false,
//             title: const Text('Piece Of Cake'),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.notifications),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Notice()),
//                   );
//                 },
//               ),
//             ],
//             bottom: AppBar(
//               title: Container(
//                 width: double.infinity,
//                 height: 40,
//                 color: Colors.white,
//                 child: const Center(
//                   child: TextField(
//                       decoration: InputDecoration(
//                         hintText: '파티검색',
//                         prefixIcon: Icon(Icons.search),)
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Other Sliver Widgets
//           SliverList(
//             delegate: SliverChildListDelegate([
//               Container(
//                 margin: EdgeInsets.all(5)
//               ),
//               Column(
//                 children: [
//                   Text('최신 파티',
//                     style: TextStyle(
//                       fontSize:20,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                   Item(),
//                 ],
//               ),
//               Container(
//                   margin: EdgeInsets.all(5)
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     width: 80,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => PartyList()),
//                           );
//                         },
//                         child: Text('전체', style: TextStyle(fontSize: 20),)
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 80,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => PartyList()),
//                           );
//                         },
//                         child: Text('소분', style: TextStyle(fontSize: 20),)
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 80,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => PartyList()),
//                           );
//                         },
//                         child: Text('공구', style: TextStyle(fontSize: 20),)
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 80,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => PartyList()),
//                           );
//                         },
//                         child: Text('배달', style: TextStyle(fontSize: 20),)
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                   margin: EdgeInsets.all(5)
//               ),
//               Column(
//                 children: [
//                   Text('광고',
//                     style: TextStyle(
//                       fontSize:20,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                   Item(),
//                 ],
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
