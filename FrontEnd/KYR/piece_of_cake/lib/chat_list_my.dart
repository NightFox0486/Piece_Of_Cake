import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/chat.dart';
import './chat.dart';

class chatRoom extends StatelessWidget {
  const chatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      hoverColor: Colors.lightGreenAccent,
      highlightColor: Colors.amber,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Chat()),
        );
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Flexible(flex: 3,
                child: CircleAvatar(
                  radius: 40,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                        child: ClipOval(
                          child: Image.asset("assets/images/harry.png",
                          ),
                        )
                    )
                ),
            ),
            Flexible(flex: 7,child: Container(
              margin: EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('율2는1004', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('송삼 편의점에서 만나쉴?', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('17:29', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('안읽음', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ],
                )
            ),
            )
          ],
        ),
      )
    );
  }
}




class ChatListMy extends StatelessWidget {
  const ChatListMy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('파티 대화 목록')
      ),
      body: ListView(
        children: [
          chatRoom(),
          chatRoom(),
          chatRoom(),
          chatRoom(),
          chatRoom(),
          chatRoom(),
          chatRoom(),
          chatRoom(),
        ],
      )
    );
  }
}