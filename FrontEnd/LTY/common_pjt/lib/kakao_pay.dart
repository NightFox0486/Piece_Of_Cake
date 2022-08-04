import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:android_intent/android_intent.dart';

void main() => runApp(
    MaterialApp(
      home: KaKaoPayPage(),
    )
);


class KaKaoPayPage extends StatefulWidget {
  @override
  _KaKaoPayPageState createState() => _KaKaoPayPageState();
}

class _KaKaoPayPageState extends State<KaKaoPayPage> {
  final _URL = 'http://localhost:3000';
  final _ADMIN_KEY = '98e2b7233148eec97632154a42241e6b';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async{
            final Uri clickurl = Uri.parse('https://kapi.kakao.com/v1/payment/ready');
            var res = await http.post(
                clickurl,
                encoding: Encoding.getByName('utf8'),
                headers: {
                  'Authorization' : 'KakaoAK $_ADMIN_KEY'
                },
                body: {
                  'cid':'TC0ONETIME',
                  'partner_order_id':'partner_order_id',
                  'partner_user_id':'partner_user_id',
                  'item_name' : 'party_title',
                  'quantity': '1',
                  'total_amount':'5000',
                  'tax_free_amount' : '0',
                  'approval_url' : '1',//결재성공시 리다이렉트 URL, 카카오개발자 Web사이트도메인에 추가 필수
                  'fail_url' : '2',//요청 유효 시간(15분) 경과: fail_url로 리다이렉트, 카카오개발자 Web사이트도메인에 추가 필수
                  'cancel_url': '3',//결재취소시 리다이렉트 URL, 카카오개발자 Web사이트도메인에 추가 필수
                }
            );

            Map<String, dynamic> result = json.decode(res.body);


            AndroidIntent intent = AndroidIntent(
              action: 'action_view',
              data: result['next_redirect_mobile_url'],
              arguments: {'txn_id': result['tid']},//tid=결재 고유 번호
            );
            await intent.launch();
          },
          child: Image.asset('assets/payicon.png'),//

        ),
      ),
    );
  }
}