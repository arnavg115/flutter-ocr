import 'package:flutter/material.dart';
import 'models.dart';
import 'pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'pages/OCR.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<PhotoModel>(
            create: (_) => PhotoModel(""),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          routes: {"/": (context) => MyHomePage(), "/ocr": (context) => OCR()},
        ));
  }
}
