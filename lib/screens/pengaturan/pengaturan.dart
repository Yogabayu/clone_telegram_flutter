import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//TODO penbaturan blm selesai
class Pengaturan extends StatefulWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  _header(context),
                  _akun(context),
                  Divider(color: Colors.transparent),
                  _pengaturan(context),
                ],
              ),
              Positioned(
                top: width * 0.28,
                left: width * 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(width * 0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 0.1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey.withOpacity(0.6),
                      size: 30,
                      // color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  CustomAppBar({
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: width * 0.1),
      height: preferredSize.height,
      color: Color.fromARGB(255, 139, 182, 218),
      child: child,
    );
  }
}

Widget _akun(context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    padding: EdgeInsets.all(width * 0.05),
    color: Colors.white,
    height: 230,
    width: width,
    child: ListView(
      children: [
        Text(
          "Akun",
          style: TextStyle(
            color: Color.fromARGB(255, 75, 169, 247),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "+62 821 39xxxxxx",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Ketuk untuk ganti nomor telepon",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Divider(),
        Text(
          "@YogaBayuAP",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "username",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Divider(),
        Text(
          "Ajg",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Bio",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

Widget _header(context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    color: Color.fromARGB(255, 99, 168, 224),
    height: width * 0.35,
    child: Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: width * 0.5,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        ListTile(
          onTap: () {},
          leading: CircleAvatar(
            radius: 27,
            backgroundImage:
                NetworkImage('https://picsum.photos/seed/girl/200/300'),
          ),
          title: Text(
            "Y O G A",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "online",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        )
      ],
    ),
  );
}

Widget _pengaturan(context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    padding: EdgeInsets.all(width * 0.05),
    color: Colors.white,
    height: height * 0.55,
    width: width,
    child: ListView(
      children: [
        Text(
          "Pengaturan",
          style: TextStyle(
            color: Color.fromARGB(255, 75, 169, 247),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: FaIcon(FontAwesomeIcons.bell),
          title: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
              ),
            ),
            child: Text("Notifikasi dan Suara"),
          ),
        ),
      ],
    ),
  );
}
