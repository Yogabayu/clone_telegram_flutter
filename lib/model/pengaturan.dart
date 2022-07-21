import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  PengaturanMenu(
    id: "2",
    ikon: Icons.lock_outline,
    title: "Privasi dan Keamanan",
  ),
  PengaturanMenu(
    id: "3",
    ikon: Icons.pie_chart_outline,
    title: "Data dan Penyimpanan",
  ),
  PengaturanMenu(
    id: "4",
    ikon: FontAwesomeIcons.comment,
    title: "Pengaturan Obrolan",
  ),
  PengaturanMenu(
    id: "5",
    ikon: Icons.emoji_emotions_outlined,
    title: "Stiker dan Emoji",
  ),
  PengaturanMenu(
    id: "6",
    ikon: Icons.folder_open_outlined,
    title: "Folder Obrolan",
  ),
  PengaturanMenu(
    id: "7",
    ikon: Icons.devices,
    title: "Perangkat",
  ),
  PengaturanMenu(
    id: "8",
    ikon: FontAwesomeIcons.globe,
    title: "Bahasa",
  ),
];
