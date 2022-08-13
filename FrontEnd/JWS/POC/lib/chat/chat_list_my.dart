import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/chat/chat.dart';
import 'chat.dart';
import '../notice.dart';

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
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.amber),
              // bottom: BorderSide(width: 1.0, color: Colors.amber),
            )
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
            Flexible(flex: 10,child: Container(
              margin: EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('율2는1004', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,),),
                          Text('송삼 편의점에서 만나쉴? ', style: TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('17:29', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,),),
                          Text('안읽음', style: TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
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
          title: Text('ChatListMy'),
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
        ],
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
          Container(
            margin: EdgeInsets.only(bottom: 50),
          )
        ],
      )
    );
  }
}