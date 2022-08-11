import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO add pesan Tersimpan
class PesanTersimpan extends StatefulWidget {
  const PesanTersimpan({Key? key}) : super(key: key);

  @override
  _PesanTersimpanState createState() => _PesanTersimpanState();
}

class _PesanTersimpanState extends State<PesanTersimpan> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: themeNotifier.isDark
                ? Color.fromARGB(255, 91, 90, 90)
                : Color.fromARGB(255, 70, 113, 148),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 58, 147, 220),
                child: Icon(Icons.bookmark_outline),
              ),
              title: Text(
                "Pesan Tersimpan",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.045,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
        );
      },
    );
  }
}
