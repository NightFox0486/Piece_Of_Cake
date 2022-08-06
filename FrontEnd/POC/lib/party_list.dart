import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './my.dart';
import './chat_list_my.dart';
import './pie_create.dart';
import './main.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Flexible(flex: 3, child: Image.asset('assets/images/harry.png', width: 150)),
          Flexible(flex: 7,child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('강아지 자랑해요',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Text('거제1동', style: TextStyle(fontSize: 15),),
                  Text('개예쁜 말티즈예요', style: TextStyle(fontSize: 20)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text('4'),
                      ]
                  )
                ],
              )
          ),
          )
        ],
      ),
    );
  }
}

class PartyList extends StatelessWidget {
  const PartyList({Key? key}) : super(key: key);

  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  //
  // final screens = [
  //   HomePage(),
  //   PartyList(),
  //   PieCreate(),
  //   ChatListMy(),
  //   My(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('PartyList'),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: '파티검색',
                        prefixIcon: Icon(Icons.search),)
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Item(),
              Item(),
              Item(),
              Item(),
              Item(),
            ]),
          ),
        ],

      ),
      // bottomNavigationBar: BottomAppBar(
      //
      //   color: Colors.amber,
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(height: 60),
      // ),
      //
      //
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() {
      //   }),
      //   tooltip: 'Increment Counter',
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // ),

    );
  }
}