import 'package:flutter/foundation.dart';

class PhotoModel extends ChangeNotifier {
  String _path = "";
  PhotoModel(String init) {
    _path = init;
  }
  String get path => _path;
  set path(String np) {
    _path = np;
    notifyListeners();
  }
}
