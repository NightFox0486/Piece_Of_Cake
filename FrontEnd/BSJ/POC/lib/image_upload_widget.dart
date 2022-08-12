// import 'dart:html';
import 'dart:io' as io;

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:piece_of_cake/firebase_options.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   final storage = FirebaseStorage.instance;
//   runApp(const ImageUploadWidget());
// }

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({Key? key}) : super(key: key);

  @override
  State<ImageUploadWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUploadWidget> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
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
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,

      children: List.generate(imageFileList!.length+1, (index) => //Padding(
        // padding: const EdgeInsets.symmetric(vertical: 50,  horizontal: 50),
        // child:
        index == imageFileList!.length ? GestureDetector(
                  onTap: () {
                    selectImages();
                  },
                  child: Container(margin: EdgeInsets.all(5),child: SizedBox(
                    height: 100,
                    width: 100,
                    child: DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 2,
                      radius: Radius.circular(8),
                      borderType: BorderType.RRect,
                      dashPattern: [8, 4],
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
                  )),
                ) : Container(width: 100,height: 100,margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      image: DecorationImage(
                          image: FileImage(io.File(imageFileList![index].path)),
                          fit: BoxFit.cover)),
                ),

            //)
    )
    );
    // return
    //   GridView.builder(
    //     itemCount: imageFileList!.length + 1,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       crossAxisSpacing: 1,
    //       mainAxisSpacing: 1,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       return index == imageFileList!.length
    //           ? GestureDetector(
    //         onTap: () {
    //           selectImages();
    //         },
    //         child: Container(
    //           child: DottedBorder(
    //             color: Colors.grey,
    //             strokeWidth: 2,
    //             radius: Radius.circular(8),
    //             borderType: BorderType.RRect,
    //             dashPattern: [8, 4],
    //             child: ClipRect(
    //               child: Container(
    //                 width: double.infinity,
    //                 height: double.infinity,
    //                 child: Icon(
    //                   Icons.add,
    //                   color: Colors.grey,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       )
    //           : Container(
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(8),
    //             color: Colors.white,
    //             image: DecorationImage(
    //                 image: FileImage(io.File(imageFileList![index].path)),
    //                 fit: BoxFit.cover)),
    //       );
    //     },
    //   ); //,
  }
}
