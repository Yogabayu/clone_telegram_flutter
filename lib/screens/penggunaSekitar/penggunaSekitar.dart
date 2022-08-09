import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

bool isShown = false;

//TODO pengguna sekitar belum selesai
class PenggunaSekitar extends StatefulWidget {
  const PenggunaSekitar({Key? key}) : super(key: key);

  @override
  _PenggunaSekitarState createState() => _PenggunaSekitarState();
}

class _PenggunaSekitarState extends State<PenggunaSekitar> {
  void _cekLocation() async {
    isShown = await Permission.locationWhenInUse.serviceStatus.isEnabled;
    if (isShown) {
      isShown = true;
    } else {
      isShown = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _cekLocation();
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
          ),
          body: isShown ? Text("pengguna sekitar") : _containerNot(context),
        );
      },
    );
  }
}

Widget _containerNot(context) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return Container(
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
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () async {
              LocationPermission permission;
              permission = await Geolocator.checkPermission();
              if (permission == LocationPermission.denied) {
                permission = await Geolocator.requestPermission();
                if (permission == LocationPermission.denied) {
                  isShown = false;
                }
              }

              if (permission == LocationPermission.deniedForever) {
                isShown = false;
              }
              if (permission == LocationPermission.always ||
                  permission == LocationPermission.whileInUse) {
                isShown = true;
              }
            },
            child: Text("Nyalakan"),
          ),
        ),
      ],
    ),
  );
}
