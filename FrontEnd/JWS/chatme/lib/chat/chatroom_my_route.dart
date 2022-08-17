import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import '../notice.dart';
import 'chat_route.dart';



class ChatRoomListMy extends StatefulWidget {
  const ChatRoomListMy({Key? key}) : super(key: key);
  

  @override
  State<ChatRoomListMy> createState() => _ChatRoomListMyState();
}

class _ChatRoomListMyState extends State<ChatRoomListMy> {

  final CollectionReference _chats = FirebaseFirestore.instance.collection('chats');
  final _database = FirebaseFirestore.instance;
  kakao.User? user;

  void _createChatRoom() async{
    user = await kakao.UserApi.instance.me();

    // 채팅방 명 변경 필요
    String chatName = user!.id.toString() + 'todb';

    await _database.collection('chats').doc(chatName).set({
      'created_at': Timestamp.now(),
      'guestNickname': 'todb',
      'guestSeq': 'todb',
      'username': user!.kakaoAccount!.profile!.nickname,
      'uid': "kakao:" + user!.id.toString(),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
          IconButton(
              onPressed: () {
                _createChatRoom();
              }, icon: Icon(Icons.add_box),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: StreamBuilder(
        stream: _chats.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
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
                        MaterialPageRoute(builder: (context) => ChatRoute()),
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
                                      child: Image.asset("image/bear.png"),
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
