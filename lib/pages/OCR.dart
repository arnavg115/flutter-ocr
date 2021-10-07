import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:ocr/models.dart';
import 'package:provider/provider.dart';

class OCR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OCR"),
        ),
        body: Center(
            child: Column(
          children: [
            Consumer<PhotoModel>(builder: (_, val, __) {
              return ElevatedButton(
                  onPressed: () async {
                    //args support android / Web , i don't have a mac
                    String text = await FlutterTesseractOcr.extractText(
                      val.path,
                      language: 'eng',
                    );
                  },
                  child: Text("Run OCR"));
            }),
            Consumer<PhotoModel>(builder: (_, val, __) {
              return Text(val.path);
            })
          ],
        )));
  }
}
