import 'dart:html';
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

  addImg() {
    setState(() async {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      UploadTask? task = await uploadFile(file);

      if (task != null) {}
      // images.insert(
      //     0,
      //     Container(
      //       child: Image.asset('img/thumb.jpg',
      //           fit: BoxFit.fill, width: 100, height: 100),
      //     ));
    });
  }

  Future<UploadTask?> uploadFile(XFile? file) async {
    if (file == null) {
      print("input images is null");
      return null;
    }

    UploadTask uploadTask;

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('image-test')
        .child('/test-image.jpg');
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );
    print('test');
    uploadTask = ref.putFile(io.File(file.path), metadata);
    print('test2');
    return Future.value(uploadTask);
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
