import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/buy_detail.dart';
import './my.dart';
import './chat_list_my.dart';
import './pie_create.dart';
import './main.dart';
import './notice.dart';

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
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                    Text('거제1동', style: TextStyle(fontSize: 10),),
                    Text('개예쁜 말티즈예요', style: TextStyle(fontSize: 15)),
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

class PartyList extends StatelessWidget {
  const PartyList({Key? key}) : super(key: key);

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notice()),
                  );
                },
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
    );
  }
}