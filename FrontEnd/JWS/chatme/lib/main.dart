import 'package:chatme/auth/auth_route.dart';
import 'package:chatme/chat/chat_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatme/kakao_login.dart';
import 'package:chatme/main_view_model.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'chat/chatroom_my_route.dart';
import 'firebase_options.dart';

import 'kakao_login.dart';
import 'main_view_model.dart';

main() async {
  kakao.KakaoSdk.init(nativeAppKey: 'ce864beffcb3fa2e11bf7100365ff72f');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAzZ4yzikQ8kEC_fKqBmZhbE2W8-YjkT_k',
      appId: '1:505795639238:android:77111a3f2604a297b3a4c7',
      messagingSenderId: '505795639238',
      projectId: 'chat-ad85f',
      databaseURL: 'https://chat-ad85f-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: 'chat-ad85f.appspot.com',
    ),
  );
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//         textButtonTheme: TextButtonThemeData(
//           style: TextButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//       ),
//       home: ChatRoomRoute()
//     );
//   }
// }


/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (builderContext, AsyncSnapshot<User?> userSnapshot) {
          if(userSnapshot.hasData){
            return ChatRoute();
          } else {
            return AuthRoute();
          }
        },
      ),
    );
  }
}
*/



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await viewModel.login();
                        setState(() {});
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await viewModel.logout();
                        setState(() {});
                      },
                      child: const Text('Logout'),
                    ),

                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                      viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                  Text(
                    '${viewModel.isLogined}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.logout();
                      setState(() {});
                    },
                    child: const Text('Logout'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatRoomListMy()),
                      );
                    },
                    child: const Text('chatRoom'),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}


