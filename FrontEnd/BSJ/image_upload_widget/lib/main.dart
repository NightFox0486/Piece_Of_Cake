// import 'dart:html';
import 'dart:io' as io;

import 'package:dotted_border/dotted_border.dart';
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
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {
    });
  }
  // static List<Widget> images = [
  //   // Container(
  //   //   child: Image.asset('img/thumb.jpg',
  //   //       fit: BoxFit.fill, width: 100, height: 100),
  //   // )
  // ];
  //
  // Future<String>? uploadFile(XFile? file,int index) async {
  //   if (file == null) {
  //     print("input images is null");
  //     return null!;
  //   }
  //
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child('image-test')
  //       .child('/test-image$index.jpg');
  //   final metadata = SettableMetadata(
  //     contentType: 'image/jpeg',
  //     customMetadata: {'picked-file-path': file.path},
  //   );
  //   if (kIsWeb) {
  //     ref.putData(await file.readAsBytes(), metadata);
  //   } else {
  //     ref.putFile(io.File(file.path), metadata);
  //   }
  //   String url = await ref.getDownloadURL();
  //   return url;
  // }
  //
  // addImgStorage(int index) async {
  //   final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   String? url = await uploadFile(file, index);
  //   if (url != null) {
  //     images.insert(
  //         0,
  //         Container(
  //           child: Image.network(url, width: 100, height: 100),
  //         ));
  //   }
  //   setState(() {});
  // }
  //
  // addImg() {
  //
  //     addImgStorage(0);
  // }
  //
  // removeImg() {
  //   setState(() {
  //     images.removeLast();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Row(
    //       textDirection: TextDirection.ltr,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ...images,
    //         Column(children: [
    //           TextButton.icon(
    //               onPressed: addImg, icon: Icon(Icons.add), label: Text('add')),
    //           TextButton.icon(
    //               onPressed: removeImg,
    //               icon: Icon(Icons.remove),
    //               label: Text('remove'))
    //         ])
    //       ]),
    // );
    return MaterialApp(home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Upload Widget"),
        ),
        body: Center(
          child: Column(
            children: [

              SizedBox(height: 20,),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: imageFileList!.length+1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return index == imageFileList!.length
                              ?Container(
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 2,
                              radius: Radius.circular(8),
                              borderType: BorderType.RRect,
                              dashPattern: [8,4],
                              child: ClipRect(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,

                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          )
                              : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: FileImage(io.File(imageFileList![index].path)),
                                    fit: BoxFit.cover
                                )
                            ),
                          );
                          // return Image.file(io.File(imageFileList![index].path), fit: BoxFit.cover);
                        },
                    ),
                  )
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Images from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    selectImages();
                  }
              ),
            ],
          ),
        )
    )
    );
  }
  // TextButton.icon(
  //       onPressed: addImg(), icon: Icon(Icons.add), label: Text('test'))
}
