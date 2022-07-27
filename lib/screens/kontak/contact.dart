import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO kontak blm selesai
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Kontak"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.sort_outlined),
              ),
            ],
          ),
          body: Container(
            child: Scrollbar(
              thickness: 7,
              thumbVisibility: true,
              child: ListView(
                children: [
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                    leading: Icon(
                      Icons.person_add_alt,
                      size: 28,
                    ),
                    title: Text("Undang Teman"),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                    leading: Icon(
                      Icons.pin_drop_outlined,
                      size: 28,
                    ),
                    title: Text("Cari Pengguna Sekitar"),
                  ),
                  Container(
                    width: width,
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(174, 158, 158, 158),
                    ),
                    child: Text(
                      "Urutan Berdasarkan waktu terlihat",
                      style: TextStyle(
                        color: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.69,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.abc),
                          title: Text("data"),
                          subtitle: Text("data"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
