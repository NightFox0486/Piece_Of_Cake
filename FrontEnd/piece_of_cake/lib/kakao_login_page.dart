import 'package:flutter/material.dart';
import 'package:piece_of_cake/models/palette.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'models/kakao_login_model.dart';

class KakaoLoginPage extends StatefulWidget {
  const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  @override
  Widget build(BuildContext context) {
    var palette = Provider.of<Palette>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Kakao Login Page'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 50,
            ),
            Image.asset('assets/images/logo_transparent.png'),
            // SizedBox(
            //   child: Text(
            //     'Piece\nOf\nCake',
            //     style: TextStyle(
            //       fontSize: 50,
            //       fontWeight: FontWeight.w900,
            //       color: palette.createMaterialColor(Color(0xff764624)),
            //     ),
            //   ),
            // ),
            SizedBox(
              // height: 150,
              // height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                // await KakaoLoginModel().setUser();
                await Provider.of<KakaoLoginModel>(context, listen: false).setUser();
                print('login');
                print('user: ${Provider.of<KakaoLoginModel>(context, listen: false).user}');
                Route route = MaterialPageRoute(builder: (context) => const MainPage());
                Navigator.pushReplacement(context, route);
              },
              style: ElevatedButton.styleFrom(
                primary: palette.createMaterialColor(Color(0xffFFE400)),
                side: BorderSide(width: 2, color: palette.createMaterialColor(Color(0xff3F1D1D))),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              ),
              child: Text(
                '카카오 로그인',
                style: TextStyle(
                  color: palette.createMaterialColor(Color(0xff3F1D1D)),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: palette.createMaterialColor(Color(0xffF9F1BF)),
    );
  }
}
