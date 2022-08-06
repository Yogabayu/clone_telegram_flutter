import 'package:flutter/material.dart';

class CardQR {
  final Color warnaQr;
  final IconData iconCard;

  CardQR({
    required this.warnaQr,
    required this.iconCard,
  });
}

List<CardQR> carditems = [
  CardQR(
    warnaQr: Colors.green,
    iconCard: Icons.home,
  ),
  CardQR(
    warnaQr: Colors.red,
    iconCard: Icons.android,
  ),
  CardQR(
    warnaQr: Colors.blue,
    iconCard: Icons.diamond,
  ),
  CardQR(
    warnaQr: Colors.yellow,
    iconCard: Icons.theater_comedy,
  ),
  CardQR(
    warnaQr: Colors.orange,
    iconCard: Icons.local_activity_rounded,
  ),
];
