//import 'dart:html';
import 'dart:io' as io;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload_widget/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final storage = FirebaseStorage.instance;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List<Widget> images = [
    Container(
      child: Image.asset('img/thumb.jpg',
          fit: BoxFit.fill, width: 100, height: 100),
    )
  ];

  Future<String>? uploadFile(XFile? file) async {
    if (file == null) {
      print("input images is null");
      return null!;
    }

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('image-test')
        .child('/test-image.jpg');
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );
    if (kIsWeb) {
      ref.putData(await file.readAsBytes(), metadata);
    } else {
      ref.putFile(io.File(file.path), metadata);
    }
    String url = await ref.getDownloadURL();
    return url;
  }

  addImgStorage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    String? url = await uploadFile(file);
    if (url != null) {
      images.insert(
          0,
          Container(
            child: Image.network(url, width: 100, height: 100),
          ));
    }
    setState(() {});
  }

  addImg() {
    setState(() {
      addImgStorage();
    });
  }

  removeImg() {
    setState(() {
      images.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...images,
            Column(children: [
              TextButton.icon(
                  onPressed: addImg, icon: Icon(Icons.add), label: Text('add')),
              TextButton.icon(
                  onPressed: removeImg,
                  icon: Icon(Icons.remove),
                  label: Text('remove'))
            ])
          ]),
    );
  }
  // TextButton.icon(
  //       onPressed: addImg(), icon: Icon(Icons.add), label: Text('test'))
}
