import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/kakao_login_model.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    print('mypage');
    print(Provider.of<KakaoLoginModel>(context).user);
    print(KakaoLoginModel().user);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.profile?.profileImageUrl ?? '',
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error, size: 100,),
          ),
          Text(Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.profile?.nickname ?? ''),
          Text(Provider.of<KakaoLoginModel>(context).user?.kakaoAccount?.email ?? '')
        ],
      ),
    );
  }
}