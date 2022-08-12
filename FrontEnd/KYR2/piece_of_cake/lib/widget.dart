import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:piece_of_cake/party/pie/pie_detail.dart';
import 'package:piece_of_cake/party/buy/buy_detail_guest.dart';
import 'package:piece_of_cake/party/buy/buy_detail_host.dart';
import 'package:piece_of_cake/party/dlv/dlv_detail.dart';
import 'package:piece_of_cake/vo.dart';
import 'package:provider/provider.dart';

import 'models/kakao_login_model.dart';
import 'models/party_model.dart';
class Item extends StatelessWidget {
  // const Item({Key? key}) : super(key: key);
  Party? _party;
  Item(Party wish, {Key? key}) : super(key: key) {
    _party = wish;
  }
  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider = Provider.of<KakaoLoginModel>(context);
    final partyProvider = Provider.of<PartyModel>(context);
    // final partyCode = '001';
    return InkWell(
        splashColor: Colors.amber,
        hoverColor: Colors.lightGreenAccent,
        highlightColor: Colors.amber,
        child: Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
                children: [
                  Flexible(flex: 4, child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/harry.png',
                      fit: BoxFit.fill,
                    ), // Text(key['title']),
                  ),
                  ),
                  Flexible(flex: 6,child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${_party?.partyTitle}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),overflow: TextOverflow.ellipsis,),
                          Text('${_party?.partyAddr}', style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis,),
                          Text('${_party?.partyContent}', style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LikeButton(),
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
          switch (_party!.partyCode) {
            case '001':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PieDetail()),
              );
              break;
            case '002':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyDetail()),
              );
              break;
            case '003':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DlvDetail()),
              );
              break;
          }
        }
    );
  }
}

