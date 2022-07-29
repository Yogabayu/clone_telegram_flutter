import 'package:flutter/material.dart';

//TODO blm selesai penggilan
class Panggilan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Silver AppBar",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  background: Image.network(
                    "https://img.freepik.com/free-vector/neon-lights-wallpaper_52683-46462.jpg?size=626&ext=jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: Text("Sukses!", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
