import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO undang teman
class UndangTeman extends StatefulWidget {
  const UndangTeman({Key? key}) : super(key: key);

  @override
  _UndangTemanState createState() => _UndangTemanState();
}

class _UndangTemanState extends State<UndangTeman> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        final double width = MediaQuery.of(context).size.width;
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
            title: Text(
              "Undang Teman",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.045,
              ),
            ),
          ),
        );
      },
    );
  }
}
