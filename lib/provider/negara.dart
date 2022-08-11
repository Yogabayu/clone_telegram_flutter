import 'package:flutter/cupertino.dart';

class NegaraProvider extends ChangeNotifier {
  String negara = "";
  String kode = "";
  var icon = "";
  void changeNegara(var icon1, String nama, String kode1) {
    negara = nama;
    icon = icon1;
    kode = kode1;
    notifyListeners();
  }
}
