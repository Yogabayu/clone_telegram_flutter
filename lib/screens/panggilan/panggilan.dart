import 'package:clone_telegram/model/panggilan.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Panggilan extends StatefulWidget {
  const Panggilan({Key? key}) : super(key: key);

  @override
  _PanggilanState createState() => _PanggilanState();
}

class _PanggilanState extends State<Panggilan> {
  void showSnackbar(String nama) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(nama),
      ),
    );
  }

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
              "Panggilan",
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 69, 168, 248),
            onPressed: () {},
            child: Icon(
              Icons.call,
              color: themeNotifier.isDark ? Colors.white : Colors.white,
            ),
          ),
          body: Container(
            width: width,
            height: height,
            child: ListView.builder(
              itemCount: panggilanItems.length,
              itemBuilder: (context, index) {
                final _items = panggilanItems[index];
                return ListTile(
                  onTap: () => showSnackbar(_items.nama),
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: ClipOval(
                      child: Image.network(
                        _items.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(_items.nama),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.call_made,
                        color: Colors.green,
                        size: 15,
                      ),
                      Text(_items.subtitle),
                    ],
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
