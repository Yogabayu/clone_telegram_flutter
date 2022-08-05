import 'dart:math';
//TODO blm selssai
import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ScrollController? _scrollController; // set controller on scrolling
  bool _show = true;
  bool lastStatus = true;
  double height = 200;
  Duration duration = Duration(milliseconds: 300);

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    Random random = Random();
    int randomInt = random.nextInt(100);
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          floatingActionButton: AnimatedSlide(
            duration: duration,
            offset: _show ? Offset.zero : Offset(0, 2),
            child: AnimatedOpacity(
              duration: duration,
              opacity: _show ? 1 : 0,
              child: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                backgroundColor: Colors.blue[300],
                child: Icon(Icons.person_add_alt_1_sharp),
              ),
            ),
          ),
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
            child: RawScrollbar(
              thumbColor: Colors.grey,
              thickness: 6,
              thumbVisibility: true,
              child: ListView(
                controller: _scrollController,
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
                    height: 28,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color:
                          Color.fromARGB(174, 158, 158, 158).withOpacity(0.1),
                    ),
                    child: Text(
                      "Urutan Berdasarkan waktu terlihat",
                      style: TextStyle(
                        color: Color.fromARGB(255, 66, 66, 66).withOpacity(0.8),
                      ),
                    ),
                  ),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "online", true),
                  _kontakItem("user${randomInt}", "terlihat pada 18.40", false),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _kontakItem(String title, String subtitle, bool isOnline) {
  Random random = Random();
  int randomInt = random.nextInt(100);

  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      backgroundImage:
          NetworkImage("https://picsum.photos/200/300?random=${randomInt}"),
      backgroundColor: Colors.transparent,
    ),
    title: Text(
      title,
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
        color: isOnline ? Colors.blue : Colors.grey,
      ),
    ),
  );
}
