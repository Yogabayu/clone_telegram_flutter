import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO pengguna sekitar belum selesai
class PenggunaSekitar extends StatefulWidget {
  const PenggunaSekitar({Key? key}) : super(key: key);

  @override
  _PenggunaSekitarState createState() => _PenggunaSekitarState();
}

class _PenggunaSekitarState extends State<PenggunaSekitar> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: themeNotifier.isDark
                ? Color.fromARGB(255, 91, 90, 90)
                : Color.fromARGB(255, 70, 113, 148),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Pengguna Sekitar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
              ),
            ),
            actions: [
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
