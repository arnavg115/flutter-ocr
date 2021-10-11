import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:ocr/models.dart';
import 'package:provider/provider.dart';
import 'package:loading_animations/loading_animations.dart';

// class OCR extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("OCR"),
//         ),
//         body: Center(
//             child: Column(
//           children: [
//             Consumer<PhotoModel>(builder: (_, val, __) {
//               return Container(
//                 child: Image.file(
//                   File(val.path),
//                   height: 200,
//                 ),
//               );
//             }),
//             Consumer<PhotoModel>(builder: (_, val, __) {
//               return ElevatedButton(
//                   onPressed: () async {
//                     //args support android / Web , i don't have a mac
//                     String text = await FlutterTesseractOcr.extractText(
//                       val.path,
//                       language: 'eng',
//                     );
//                     print(text);
//                   },
//                   child: Text("Run OCR"));
//             }),
//           ],
//         )));
//   }
// }

class OCR extends StatefulWidget {
  const OCR({Key? key}) : super(key: key);

  @override
  _OCRState createState() => _OCRState();
}

class _OCRState extends State<OCR> {
  bool _loading = false;
  String _res = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OCR"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Consumer<PhotoModel>(
                  builder: (_, value, __) {
                    return Container(
                      child: Image.file(
                        File(value.path),
                        height: 200,
                      ),
                    );
                  },
                ),
                Consumer<PhotoModel>(builder: (_, value, __) {
                  return Container(
                    child: ElevatedButton(
                        child: _loading
                            ? LoadingBouncingLine.circle(
                                size: 25,
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, 1))
                            : Text("Run ocr"),
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          String text = await FlutterTesseractOcr.extractText(
                              value.path,
                              language: "eng");
                          _res = text;
                          _loading = false;
                          setState(() {});
                        }),
                  );
                }),
                Text(_res)
              ],
            ),
          ),
        ));
  }
}
