import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const HttpGetUserList(),
              const HttpPostUser(),
              Center(
                child: Row(
                    children: [
                      Image.asset('user.png', width: 50, height: 50,),
                    ]
                ),
              ),
            ],
          ),
        )
    );
  }
}

class UserReqVO {
  String? userEmail;
  String? userPhone;
  String? userNickname;
  String? userPassword;
  String? userImage;
  int? userRating;
  String? userLat;
  String? userLng;
  String? userAccount;

  UserReqVO(
        this.userEmail,
        this.userPhone,
        this.userNickname,
        this.userPassword,
        this.userImage,
        this.userRating,
        this.userLat,
        this.userLng,
        this.userAccount,
  );

  UserReqVO.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    userNickname = json['userNickname'];
    userPassword = json['userPassword'];
    userImage = json['userImage'];
    userRating = json['userRating'];
    userLat = json['userLat'];
    userLng = json['userLng'];
    userAccount = json['userAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userNickname'] = this.userNickname;
    data['userPassword'] = this.userPassword;
    data['userImage'] = this.userImage;
    data['userRating'] = this.userRating;
    data['userLat'] = this.userLat;
    data['userLng'] = this.userLng;
    data['userAccount'] = this.userAccount;
    return data;
  }
}

class User {
  int? userSeq;
  String? userEmail;
  String? userPhone;
  String? userNickname;
  String? userPassword;
  String? userImage;
  int? userRating;
  String? userLat;
  String? userLng;
  String? userAccount;
  List<Null>? partyList;

  User(
      {this.userSeq,
        this.userEmail,
        this.userPhone,
        this.userNickname,
        this.userPassword,
        this.userImage,
        this.userRating,
        this.userLat,
        this.userLng,
        this.userAccount,
        this.partyList});

  User.fromJson(Map<String, dynamic> json) {
    userSeq = json['userSeq'];
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    userNickname = json['userNickname'];
    userPassword = json['userPassword'];
    userImage = json['userImage'];
    userRating = json['userRating'];
    userLat = json['userLat'];
    userLng = json['userLng'];
    userAccount = json['userAccount'];
    if (json['partyList'] != null) {
      partyList = <Null>[];
      json['partyList'].forEach((v) {
        // partyList!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userSeq'] = this.userSeq;
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userNickname'] = this.userNickname;
    data['userPassword'] = this.userPassword;
    data['userImage'] = this.userImage;
    data['userRating'] = this.userRating;
    data['userLat'] = this.userLat;
    data['userLng'] = this.userLng;
    data['userAccount'] = this.userAccount;
    if (this.partyList != null) {
      // data['partyList'] = this.partyList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserResVO {
  int? userSeq;
  String? userNickname;

  UserResVO(
      {this.userSeq,
        this.userNickname});

  UserResVO.fromJson(Map<String, dynamic> json) {
    userSeq = json['userSeq'];
    userNickname = json['userNickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userSeq'] = this.userSeq;
    data['userNickname'] = this.userNickname;
    return data;
  }
}

class HttpGetUserList extends StatefulWidget {
  const HttpGetUserList({Key? key}) : super(key: key);

  @override
  _HttpGetUserListState createState() => _HttpGetUserListState();
}

class HttpPostUser extends StatefulWidget {
  const HttpPostUser({Key? key}) : super(key: key);

  @override
  _HttpPostUserState createState() => _HttpPostUserState();
}

Future<List<User>> fetchUserList() async {
  final response = await http.get(
      Uri.parse('http://localhost:9090/users')
  );

  if(response.statusCode == 200){
    List<User> userList = (jsonDecode(response.body) as List)
        .map((e) => User.fromJson(e))
        .toList();
    for (User user in userList) {
      print(user.userEmail);
      print(user.userNickname);
    }
    return userList;
    // return (jsonDecode(response.body) as List)
    //     .map((e) => User.fromJson(e))
    //     .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<UserResVO> createUser() async {
  var data = jsonEncode({
    'userEmail': 'ieii@iii.com',
    'userPhone': '999-3333-4444',
    'userNickname': 'iiii',
    'userPassword': 'iiii',
    'userImage': 'iiii',
    'userRating': '99',
    'userLat': '987',
    'userLng': '987',
    'userAccount': '9999',
  });
  final response = await http.post(
    Uri.parse('http://localhost:9090/users'),
    headers: <String, String> {
      'Content-Type': 'application/json'
    },
    body: data,
  );
  if (response.statusCode==200) {
    return UserResVO.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user');
  }
}

class _HttpGetUserListState extends State<HttpGetUserList> {
  late Future<List<User>> futureUserList;

  @override
  void initState() {
    super.initState();
    futureUserList = fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: futureUserList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                ...snapshot.data!.map((e) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        Text("useSeq: "+e.userSeq!.toString()+", "),
                        Text("userNickname: "+e.userNickname!+", "),
                        Text("userEmail: "+e.userEmail!),
                      ],
                    )
                  ),
                )),
              ],
            );
          } else if(snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const CircularProgressIndicator();
        }
    );
  }
}

class _HttpPostUserState extends State<HttpPostUser> {
  late Future<UserResVO> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = createUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            return Container(
                child: Text(snapshot.data!.toString()),
            );
        } else if (snapshot.hasError) {
          return Text('snapshot has error: ${snapshot.hasError}');
      }
        return const CircularProgressIndicator();
      }
    );
  }
}

// class Session {
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   };
//   Map<String, String> cookies = {};
//   Future<dynamic> get(String url) async {
//     print('get() url: $url');
//     http.Response response = await http.get(Uri.encodeFull(url), headers: headers);
//     final int statusCode = response.statusCode;
//     if (statusCode<200 || statusCode>400 || json==null) {
//       // 코드 입력
//     }
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
//   Future<dynamic> post(String url, dynamic data) async {
//     print('post() url: $url');
//     http.Response response = await http.post(Uri.encodeFull(url), body: json.encode(data), headers: headers);
//     final int statusCode = response.statusCode;
//     if (statusCode<200 || statusCode>400 || json==null) {
//       // 코드 입력
//     }
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
// }