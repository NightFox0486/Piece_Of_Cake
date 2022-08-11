import 'package:flutter/material.dart';
import '../../notice.dart';
import '../../search.dart';
import 'package:piece_of_cake/widget.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('WishList'),
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

