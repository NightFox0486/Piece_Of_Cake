import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './my.dart';
import './chat_list_my.dart';
import './pie_create.dart';
import './party_list.dart';
import './notice.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            title: const Text('Piece Of Cake'),
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
                  Item(),
                ],
              ),
              Container(
                  margin: EdgeInsets.all(5)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('전체')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('소분')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('나눠')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PartyList()),
                        );
                      },
                      child: Text('배달')),
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
            ]),
          ),
        ],
      ),
    );
  }
}





