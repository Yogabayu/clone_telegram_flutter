import 'dart:math';

import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class PenggunaSekitar extends StatefulWidget {
  const PenggunaSekitar({Key? key}) : super(key: key);

  @override
  _PenggunaSekitarState createState() => _PenggunaSekitarState();
}

class _PenggunaSekitarState extends State<PenggunaSekitar> {
  bool isShown = false;
  bool _isSee = false;
  bool _isSeeGroup = false;
  void _cekLocation() async {
    LocationPermission permission;
    isShown = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      setState(() {
        isShown = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          body: Container(
            width: width,
            height: height,
            child: ListView(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                isShown
                    ? Container(
                        width: width,
                        height: width * 1.65,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.41),
                              padding: EdgeInsets.all(10),
                              height: width * 0.17,
                              child: ClipOval(
                                child: Lottie.asset(
                                  "assets/pinMap.json",
                                  animate: true,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.08,
                            ),
                            Center(
                              child: Text(
                                "Pengguna Sekitar",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Tukar info kontak dengan pengguna sekitar dan temukan teman baru.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 10,
                            ),
                            AnimatedSize(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.0,
                                      top: 15,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "Pengguna Sekitar",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 75, 169, 247),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.online_prediction_sharp,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    title: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.2)),
                                        ),
                                      ),
                                      child: Text("Buat Saya Terlihat"),
                                    ),
                                    textColor: Colors.blue,
                                  ),
                                  _itemsTile(),
                                  _itemsTile(),
                                  _itemsTile(),
                                  _isSee ? _hiddenTile() : SizedBox(),
                                  ListTile(
                                    onTap: () => setState(() {
                                      _isSee = !_isSee;
                                    }),
                                    leading: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    title: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Tampilkan Lebih (95)"),
                                    ),
                                    textColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 10,
                            ),
                            AnimatedSize(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.0,
                                      top: 15,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "Grup Sekitar",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 75, 169, 247),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.group_add_outlined,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    title: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.2)),
                                        ),
                                      ),
                                      child: Text("Buat Grup Lokal"),
                                    ),
                                    textColor: Colors.blue,
                                  ),
                                  _itemsTile(),
                                  _itemsTile(),
                                  _itemsTile(),
                                  _isSeeGroup ? _hiddenTile() : SizedBox(),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        _isSeeGroup = !_isSeeGroup;
                                      });
                                    },
                                    leading: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    title: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Tampilkan Lebih (95)"),
                                    ),
                                    textColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        width: width,
                        height: height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.all(10),
                              height: width * 0.2,
                              width: width * 0.2,
                              child: ClipOval(
                                child: Lottie.asset(
                                  "assets/pinMap.json",
                                  animate: true,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.08,
                            ),
                            Text(
                              "Pengguna Sekitar",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.1,
                            ),
                            Text(
                              "Gunakan Bagian ini untuk menambahkan Penggunaan Sekitar & menemukan Grup di sekitar Anda lebih cepat.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.1,
                            ),
                            Text(
                              "Mohon izinkan akses lokasi untuk menggunakan fitur ini",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.1,
                            ),
                            Container(
                              width: width * 0.5,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () async {
                                  _cekLocation();
                                  print(isShown);
                                },
                                child: Text("Nyalakan"),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _hiddenTile() {
  return Column(
    children: [
      _itemsTile(),
      _itemsTile(),
      _itemsTile(),
      _itemsTile(),
      _itemsTile(),
      _itemsTile(),
    ],
  );
}

Widget _itemsTile() {
  var _random = Random();
  int random = _random.nextInt(10);
  return ListTile(
    leading: Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
      width: 50,
      height: 50,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://picsum.photos/200/300?random" + random.toString(),
        ),
      ),
    ),
    title: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Text(
        "elena" + random.toString(),
      ),
    ),
  );
}
