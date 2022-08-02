import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO blm selesai penggilan
class Panggilan extends StatefulWidget {
  @override
  State<Panggilan> createState() => _PanggilanState();
}

class _PanggilanState extends State<Panggilan> {
  ScrollController? _scrollController;

  bool lastStatus = true;

  double height = 200;

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
    final TextTheme textTheme = Theme.of(context).textTheme;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              pinned: true,
              expandedHeight: 275,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: _isShrink
                    ? const Text(
                        "Profile",
                      )
                    : null,
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://picsum.photos/seed/girl/200/300'),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 10,
                        ),
                        child: Text(
                          "Saya Aslinya Ultramen",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, bottom: 30),
                        child: Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: _isShrink
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Flipkart",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "flipkart.com",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://picsum.photos/seed/girl/200/300',
                                fit: BoxFit.cover,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  : [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 5),
                        child: Row(
                          children: [
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
                                Icons.more_vert_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          ];
        },
        // body: CustomScrollView(
        //   scrollBehavior: ScrollBehavior(),
        //   slivers: [
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Center(child: Text("Item: $index")),
        //           );
        //         },
        //         childCount: 50,
        //       ),
        //     ),
        //   ],
        // ),
        body: Container(
          width: width,
          height: height,
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      _akun(context),
                      Divider(color: Colors.transparent),
                      // _pengaturan(context),
                      // Divider(color: Colors.transparent),
                      // _premium(context),
                      // Divider(color: Colors.transparent),
                      // _bantuan(context),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   color: Colors.transparent,
                      //   child: Text(
                      //     "Telegram untuk Android v8.8.4 (2711) store bundled arm64-v8a",
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50,
                      // )
                    ],
                  ),
                  // Positioned(
                  //   top: width * 0.28,
                  //   left: width * 0.8,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       // border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(width * 0.8),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.2),
                  //           blurRadius: 0.1,
                  //           offset: Offset(0, 3), // changes position of shadow
                  //         ),
                  //       ],
                  //     ),
                  //     child: CircleAvatar(
                  //       radius: 27,
                  //       backgroundColor: Colors.white,
                  //       child: Icon(
                  //         Icons.camera_alt_outlined,
                  //         color: Colors.grey.withOpacity(0.6),
                  //         size: 30,
                  //         // color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _akun(context) {
  final width = MediaQuery.of(context).size.width;

  return Consumer<ThemeModel>(
    builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        padding: EdgeInsets.all(width * 0.05),
        color: themeNotifier.isDark
            ? Color.fromARGB(255, 29, 31, 31)
            : Colors.white,
        height: 215,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
    },
  );
}
