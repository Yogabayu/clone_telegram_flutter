import 'package:flutter/material.dart';

//TODO perbaikan pergantian thema belum selesai
class ThemeModel with ChangeNotifier {
  final ThemeMode _mode;
  ThemeMode get mode => _mode;

  ThemeModel(this._mode);
}
