import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../notice.dart';
import 'chat_route.dart';



class ChatRoomListParty extends StatefulWidget {

  const ChatRoomListParty({Key? key, required this.partySeq}) : super(key: key);
  final int partySeq;


  @override
  State<ChatRoomListParty> createState() => _ChatRoomListPartyState();
}

class _ChatRoomListPartyState extends State<ChatRoomListParty> {


  @override
  Widget build(BuildContext context) {

    final Query<Map<String, dynamic>> _chats = FirebaseFirestore.instance.collection('chats').where("partyseq", isEqualTo: widget.partySeq);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('파티 채팅'),
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
      extendBodyBehindAppBar: true,
      body: StreamBuilder(
        stream: _chats.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          print(streamSnapshot);
          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                return InkWell(
                    splashColor: Colors.amber,
                    hoverColor: Colors.lightGreenAccent,
                    highlightColor: Colors.amber,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatRoute(chatId: documentSnapshot['chatroomName'])),
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
                                      child: Image.asset("assets/images/harry.png"),
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
                                        Text(documentSnapshot['guestNickname'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,),),
                                        Text(documentSnapshot['last_text'], style: TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis, color: Colors.black54)),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('15:40', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, color: Colors.black54),),
                                        Text('안읽음', style: TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis, color: Colors.deepOrangeAccent)),
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
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
