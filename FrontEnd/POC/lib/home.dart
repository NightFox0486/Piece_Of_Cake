import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/party/buy/buy_detail_guest.dart';
import 'package:piece_of_cake/party/buy/buy_detail_host.dart';
import 'package:piece_of_cake/party/party_list.dart';
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
  // List<CardItem> items = [
  //   CardItem(
  //     urlImage:'assets/images/harry.png',
  //     title: '강아지 자랑해요 진짜',
  //     subtitle: ''
  //   )
  // ];


  @override
  Widget build(BuildContext context) {
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
                      buildCard(),
                      SizedBox(width:12),
                      buildCard(),
                      SizedBox(width:12),
                      buildCard(),
                      SizedBox(width:12),
                      buildCard(),
                      SizedBox(width:12),
                      buildCard(),
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
          Column(
            children: [
              Text('광고',
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),),
              Item(),
            ],
          ),
        ]
      ),
    );
  }
  Widget buildCard() => InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BuyDetailGuest()),
      );
    },
    child: Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/harry.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '강아지 자랑해요 진짜 개예뻐요',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          Text(
            '값을 매길 수 없음 ₩',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],


      ),
    ),
  );
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
