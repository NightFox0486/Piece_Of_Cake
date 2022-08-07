import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final storage = FirebaseStorage.instance;
  final storageRef = storage.ref();
  final mountainsRef = storageRef.child("mountains.jpg");
  final mountainImagesRef = storageRef.child("images/mountains.jpg");
  assert(mountainsRef.name == mountainImagesRef.name);
  assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = appDocDir.path + '/test.jpg';
  File file = await File(filePath).create(recursive: true);

  final task = await mountainsRef.putFile(file);
  String testImagURl = await mountainsRef.getDownloadURL();
  print(testImagURl);

//   task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
//   switch (taskSnapshot.state) {
//     case TaskState.running:
//       final progress =
//           100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
//       print("Upload is $progress% complete.");
//       break;
//     case TaskState.paused:
//       print("Upload is paused.");
//       break;
//     case TaskState.canceled:
//       print("Upload was canceled");
//       break;
//     case TaskState.error:
//       // Handle unsuccessful uploads
//       break;
//     case TaskState.success:
//       // Handle successful uploads on complete
//       // ...
//       break;
//   }
// });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: ImageUploadWidget(),
      ),
    );
  }
}

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({Key? key}) : super(key: key);

  @override
  State<ImageUploadWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
