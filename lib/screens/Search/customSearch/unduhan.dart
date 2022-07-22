import 'package:flutter/material.dart';

class Unduhan extends StatefulWidget {
  const Unduhan({Key? key}) : super(key: key);

  @override
  _UnduhanState createState() => _UnduhanState();
}

class _UnduhanState extends State<Unduhan> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            width: width,
            height: width * 0.06,
            color: Colors.grey.withOpacity(0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Terkini",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Hapus Semua",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/200/300?random=1"),
              ),
            ),
            title: Text("Jujtsu Kaisen Movie"),
            subtitle: Text("3.6 GB."),
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/200/300?random=1"),
              ),
            ),
            title: Text("Jujtsu Kaisen Movie"),
            subtitle: Text("3.6 GB."),
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/200/300?random=1"),
              ),
            ),
            title: Text("Jujtsu Kaisen Movie"),
            subtitle: Text("3.6 GB."),
          ),
        ],
      ),
    );
  }
}
