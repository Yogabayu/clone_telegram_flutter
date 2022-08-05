import 'package:flutter/material.dart';

class QrController extends ChangeNotifier {
  Color colorQr = Colors.green;

  void changeColor(Color warna) {
    colorQr = warna;
    notifyListeners();
  }
}
