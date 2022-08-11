import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/buy_detail_host.dart';
import './my.dart';
import './chat_list_my.dart';
import './pie_create.dart';
import './main.dart';
import './notice.dart';
import './search.dart';
import 'package:like_button/like_button.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      hoverColor: Colors.lightGreenAccent,
      highlightColor: Colors.amber,
      child: Container(
        height: 150,
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
                    Text('강아지 자랑해요',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),overflow: TextOverflow.ellipsis,),
                    Text('거제1동', style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
                    Text('개예쁜 말티즈예요', style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LikeButton(),
                        Text('4'),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuyDetail()),
        );
      }
    );
  }
}

class PartyList extends StatefulWidget {
  const PartyList({Key? key}) : super(key: key);

  @override
  State<PartyList> createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('PartyList'),
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
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Item(),
            Container(
              margin: EdgeInsets.only(bottom: 50),
            )
          ]
      ),
    );
  }
}


// class PartyList extends StatelessWidget {
//   const PartyList({Key? key}) : super(key: key);
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
//             title: const Text('PartyList'),
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
//               Item(),
//               Item(),
//               Item(),
//               Item(),
//               Item(),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

