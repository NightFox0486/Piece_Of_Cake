import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/party/party_list.dart';
import 'user/my.dart';
import 'chat/chat_list_my.dart';
import 'party/pie/pie_create.dart';
import 'party/wish/wish_list.dart';
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
