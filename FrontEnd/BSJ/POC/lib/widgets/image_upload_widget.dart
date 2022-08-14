// import 'dart:html';
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:piece_of_cake/firebase_options.dart';
import 'package:piece_of_cake/vo.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   final storage = FirebaseStorage.instance;
//   runApp(const ImageUploadWidget());
// }

GlobalKey<_ImageUploadState> imageKey = GlobalKey();

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({Key? key}) : super(key: key);

  @override
  State<ImageUploadWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUploadWidget> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  List<String> imageUrlList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  Future<String>? uploadFile(XFile? file, int index) async {
    if (file == null) {
      print("input images is null");
      return null!;
    }

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('image-test')
        .child('/test-image$index.jpg');
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

  addImgStorage(XFile file, int index, int partySeq) async {
    // final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    String? url = await uploadFile(file, index);
    if (url != null) {
      ImageUploadReqVO imageUploadReqVO = ImageUploadReqVO(
        fileName: 'test',
        fileUrl: 'test',
        partySeq: partySeq,
      );

      final response = await http.post(
        Uri.parse('http://i7e203.p.ssafy.io:9090/party'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(partyReqVO),
      );
      print('response.body: ${response.body}');
    }
    setState(() {});
  }

  void addImage(int partySeq) {
    print('test');
    //addImgStorage(0);
    for (int i = 0; i < imageFileList!.length; i++) {
      addImgStorage(imageFileList![i], i, partySeq);
    }
    // db에 저장
  }
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
        children: List.generate(
          imageFileList!.length + 1,
          (index) => //Padding(
              // padding: const EdgeInsets.symmetric(vertical: 50,  horizontal: 50),
              // child:
              index == imageFileList!.length
                  ? GestureDetector(
                      onTap: () {
                        selectImages();
                      },
                      child: Container(
                          margin: EdgeInsets.all(5),
                          child: SizedBox(
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
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          image: DecorationImage(
                              image: FileImage(
                                  io.File(imageFileList![index].path)),
                              fit: BoxFit.cover)),
                    ),

          //)
        ));
  }
}
