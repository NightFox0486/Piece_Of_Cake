import 'package:flutter/material.dart';
import 'package:piece_of_cake/image_upload_widget.dart';

// GlobalKey<_ImageUploadState> globalKey = GlobalKey();

class BuyCreate extends StatefulWidget {
  const BuyCreate({Key? key}) : super(key: key);

  @override
  State<BuyCreate> createState() => _BuyCreateState();
}

class _BuyCreateState extends State<BuyCreate> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuyCreate'),
        actions: [
          IconButton(onPressed: (){
            imageKey.currentState?.addImage();
          }, icon: Icon(Icons.done))
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
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber), borderRadius: BorderRadius.circular((15))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '제목',
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                        onSaved: (val) {},
                        validator: (val) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber), borderRadius: BorderRadius.circular((15))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '총 가격',
                          suffixText: '원',
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                        onSaved: (val) {},
                        validator: (val) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber), borderRadius: BorderRadius.circular((15))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '소분 인원',
                          suffixText: '명',
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                        onSaved: (val) {},
                        validator: (val) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber), borderRadius: BorderRadius.circular((15))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '개별 금액'
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                        onSaved: (val) {},
                        validator: (val) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber), borderRadius: BorderRadius.circular((15))),
                      child: Expanded(
                        child: SizedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '내용',
                              ),
                              maxLines: 15,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                              onSaved: (val) {},
                              validator: (val) {
                                return null;
                              },
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber), borderRadius: BorderRadius.circular((15))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '랑데뷰 포인트'
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                        onSaved: (val) {},
                        validator: (val) {
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
                )
            ),
          ),



        ],
      ),
    );
  }
}
