import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//TODO panggilan blm selesai

class Panggilan extends StatefulWidget {
  const Panggilan({Key? key}) : super(key: key);

  @override
  _PanggilanState createState() => _PanggilanState();
}

class _PanggilanState extends State<Panggilan> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
              "Panggilan",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 69, 168, 248),
            onPressed: () {},
            child: Icon(
              Icons.call,
              color: themeNotifier.isDark ? Colors.white : Colors.white,
            ),
          ),
        );
      },
    );
  }
}
