import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Musik extends StatefulWidget {
  const Musik({Key? key}) : super(key: key);

  @override
  _MusikState createState() => _MusikState();
}

class _MusikState extends State<Musik> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.8,
      child: ListView(
        children: [
          Stack(
            children: [
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 162, 213),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                title: Text("Counting Star "),
                subtitle: Text(
                  "Denny Caknan -> Gudang lagu",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
                trailing: Text(
                  "32 Apr",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 45,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 100, 162, 213),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
