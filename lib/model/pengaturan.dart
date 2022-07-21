import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//TODO pengaturan model blm selsai
class PengaturanMenu {
  final String id;
  final IconData ikon;
  final String title;
  PengaturanMenu({required this.id, required this.ikon, required this.title});
}

List<PengaturanMenu> dummyPengaturan = [
  PengaturanMenu(
    id: "1",
    ikon: FontAwesomeIcons.bell,
    title: "Notifikasi dan Suara",
  ),
];
