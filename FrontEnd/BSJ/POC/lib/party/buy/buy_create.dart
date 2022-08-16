import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:piece_of_cake/models/kakao_login_model.dart';
import 'package:piece_of_cake/vo.dart';
import 'package:piece_of_cake/widgets/image_upload_widget.dart';
import 'package:provider/provider.dart';
// import 'package:piece_of_cake/widgets/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// GlobalKey<_ImageUploadState> globalKey = GlobalKey();

class BuyCreate extends StatefulWidget {
  const BuyCreate({Key? key}) : super(key: key);

  @override
  State<BuyCreate> createState() => _BuyCreateState();
}

class _BuyCreateState extends State<BuyCreate> {
  final formKey = GlobalKey<FormState>();

  String? name = '';
  String? content = '';

  createParty(var kakaoUserProvider) {
    insertParty(kakaoUserProvider);
  }

  Future insertParty(var kakaoUserProvider) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    PartyReqVO partyReqVO = PartyReqVO(
        itemLink: 'test',
        partyAddr: 'test',
        partyAddrDetail: 'test',
        partyStatus: 1,
        partyBookmarkCount: 0,
        partyCode: '002',
        partyContent: content!,
        partyMemberNumCurrent: 1,
        partyMemberNumTotal: 5,
        partyRdvLat: '0',
        partyRdvLng: '0',
        partyTitle: name!,
        totalAmount: '0',
        partyMainImageUrl: 'assets/images/harry.png',
        userSeq: kakaoUserProvider.userResVO!.userSeq);
    // print(name);
    final response = await http.post(
      Uri.parse('http://i7e203.p.ssafy.io:9090/party'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(partyReqVO),
    );
    // print('response.body: ${response.body}');
    //print(Party.fromJson(jsonDecode(utf8.decode(response.bodyBytes))));
    // print(response.body.substring(response.body.indexOf("partySeq") + 10, response.body.indexOf("userSeq") - 2));
    int partySeq = int.parse(response.body.substring(
        response.body.indexOf("partySeq") + 10,
        response.body.indexOf("userSeq") - 2));
    imageKey.currentState?.addImage(partySeq);
  }

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final kakaoUserProvider =
        Provider.of<KakaoLoginModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('BuyCreate'),
        actions: [
          IconButton(
              onPressed: () {
                createParty(kakaoUserProvider);
              },
              icon: Icon(Icons.done))
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: ImageUploadWidget(key: imageKey),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular((15))),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '제목',
                          ),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          onSaved: (val) {
                            setState(() {
                              name = val as String;
                            });
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter something";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular((15))),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '총 가격',
                            suffixText: '원',
                          ),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          onSaved: (val) {},
                          validator: (val) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular((15))),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '소분 인원',
                            suffixText: '명',
                          ),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          onSaved: (val) {},
                          validator: (val) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular((15))),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: '개별 금액'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          onSaved: (val) {},
                          validator: (val) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular((15))),
                      child: SizedBox(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '내용',
                            ),
                            maxLines: 15,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                            onSaved: (val) {
                              setState(() {
                                content = val as String;
                              });
                            },
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter something";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.amber),
                borderRadius: BorderRadius.circular((15))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                child: Text('랑데뷰 포인트 설정'),
                onPressed: () {},
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.amber),
                borderRadius: BorderRadius.circular((15))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: '주소  적힐곳'),
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                onSaved: (val) {},
                validator: (val) {
                  return null;
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Wrap(children: [
              SizedBox(
                width: 400,
                height: 400,
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
