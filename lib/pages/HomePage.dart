import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/models.dart';
import 'package:provider/provider.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ImagePicker _imagePicker = ImagePicker();
//   String _path = "";
//   String _ocr = "";
//   bool _loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Container(
//               child: _path != ""
//                   ? Image.file(
//                       File(_path),
//                       height: 200,
//                     )
//                   : Text("Hello"),
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//             ),
//             Container(
//               child: _path != ""
//                   ? ElevatedButton(
//                       onPressed: () async {
//                         _loading = true;
//                         setState(() {});
//                         String res =
//                             await FlutterTesseractOcr.extractText(_path);
//                         _ocr = res;
//                         _loading = false;
//                         setState(() {});
//                       },
//                       child: Text("Run OCR"))
//                   : Text(""),
//             ),
//             Container(
//               child: SingleChildScrollView(
//                 child: Text(_ocr != "" ? _ocr : ""),
//                 clipBehavior: Clip.hardEdge,
//                 padding: EdgeInsets.all(10),
//               ),
//               height: 300,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   XFile? x =
//                       await _imagePicker.pickImage(source: ImageSource.camera);
//                   if (x != null) {
//                     _path = x.path;
//                     setState(() {});
//                   }
//                 },
//                 child: Text("Load from Camera")),
//             ElevatedButton(
//                 onPressed: () {
//                   _ocr = "";
//                   _path = "";
//                   setState(() {});
//                 },
//                 child: Text("clear"))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           XFile? x = await _imagePicker.pickImage(source: ImageSource.gallery);
//           if (x != null) {
//             _path = x.path;
//             setState(() {});
//           }
//         },
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OCR"),
      ),
      body: Center(child: Consumer<PhotoModel>(builder: (_, value, __) {
        return Column(children: [
          Text(value.path),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    ImagePicker _imagePicker = new ImagePicker();
                    XFile? res = await _imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (res != null) {
                      value.path = res.path;
                    }
                  },
                  child: Text("Choose from Gallery")),
              ElevatedButton(
                  onPressed: () async {
                    ImagePicker _imagePicker = new ImagePicker();
                    XFile? res = await _imagePicker.pickImage(
                        source: ImageSource.camera);
                    if (res != null) {
                      value.path = res.path;
                      Navigator.pushNamed(context, "/ocr");
                    }
                  },
                  child: Text("Choose from Camera"))
            ],
          )
        ]);
      })),
    );
  }
}
