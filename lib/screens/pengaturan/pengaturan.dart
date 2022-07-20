import 'package:flutter/material.dart';

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
                  Container(
                    color: Color.fromARGB(255, 126, 182, 228),
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
                            backgroundImage: NetworkImage(
                                'https://picsum.photos/seed/girl/200/300'),
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
                  ),
                  Container(
                    color: Colors.white,
                    height: height * 0.3,
                  ),
                  Text("data"),
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
