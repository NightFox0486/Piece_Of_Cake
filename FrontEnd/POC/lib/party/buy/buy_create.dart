import 'package:flutter/material.dart';

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
      ),
      body: ListView(
        children: [
          Form(
              key: formKey,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                    onSaved: (val) {},
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                    onSaved: (val) {},
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                    onSaved: (val) {},
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                    onSaved: (val) {},
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                    onSaved: (val) {},
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
              ],
              )
          ),



        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('파티 생성')
        ),
      ),
    );
  }
}
