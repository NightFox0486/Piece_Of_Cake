import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './my.dart';
import './chat_list_my.dart';
import './pie_create.dart';
import './party_list.dart';
import './notice.dart';
import 'models/kakao_login_model.dart';
import 'models/party_model.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<KakaoLoginModel>(context, listen: false);
    final partyProvider = Provider.of<PartyModel>(context, listen: false);
    partyProvider.fetchWishPartyList(userProvider.userResVO?.userSeq);
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
            ]),
          ),
        ],
      ),
    );
  }
}





