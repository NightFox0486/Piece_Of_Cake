import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piece_of_cake/kakao/kakao_login.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';
import 'package:provider/provider.dart';
import '../notice.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../party/bookmark//bookmark_list.dart';
import 'package:piece_of_cake/widget.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  final kakaoLoginModel = KakaoLoginModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
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
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
                borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.profile?.nickname ?? '',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.profile?.profileImageUrl ?? '',
                              placeholder: (context, url) => new CircularProgressIndicator(),
                              errorWidget: (context, url, error) => new Icon(Icons.error, size: 100,),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('당신은,,', style: TextStyle(fontSize: 20),),
                    Container(
                      margin: EdgeInsets.all(5),
                    ),
                    SfLinearGauge(
                        markerPointers: [
                          LinearShapePointer(value: 50, height: 25, width: 25, color: Colors.amber,)
                        ],
                        showTicks: false,
                        axisTrackStyle: LinearAxisTrackStyle(
                            thickness: 15,
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.blue],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.1, 0.5],
                                tileMode: TileMode.clamp
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                    ),
                    Text('파티를 즐길 줄 아는 파티왕?!', style: TextStyle(fontSize: 20)),
                  ],
                ),
              )
            ),
          ],
      ),
    );
  }
}