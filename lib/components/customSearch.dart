//TODO belum selesai customsearch

import 'package:clone_telegram/model/obrolan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final FocusNode _focusNode = FocusNode();
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          actions: [
            SizedBox(
              width: 70,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Cari',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            indicatorPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            indicatorWeight: 4.5,
            indicatorColor: Color.fromARGB(255, 94, 177, 245),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 15,
            ),
            tabs: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Obrolan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Media",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Unduhan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Tautan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Berkas",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Musik",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Suara",
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            obrolan(context),
            const Center(
              child: Text('This is Media screen.'),
            ),
            const Center(
              child: Text('This is Unduhan screen.'),
            ),
            const Center(
              child: Text('This is Tautan screen.'),
            ),
            const Center(
              child: Text('This is Obrolan screen.'),
            ),
            const Center(
              child: Text('This is Media screen.'),
            ),
            const Center(
              child: Text('This is Unduhan screen.'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget obrolan(context) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return Container(
    child: Column(
      children: [
        Container(
          width: width,
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dummyObrolan.length,
            itemBuilder: (context, index) {
              final nama = dummyObrolan[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                height: width * 0.1,
                width: width * 0.16,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(nama.images),
                      ),
                    ),
                    Center(
                      child: Text(
                        nama.title,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
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
        _terkini(
          'https://picsum.photos/seed/girl/200/300',
          "Pinos",
          "terlihat sebulan yang lalu",
          false,
          "",
          false,
        ),
        _terkini(
          'https://picsum.photos/seed/news/200/300',
          "Bot Berita",
          "bot",
          true,
          "12",
          false,
        ),
      ],
    ),
  );
}

Widget _terkini(
  urlImage,
  title,
  terlihat,
  bool isOnline,
  String unRead,
  bool isPinned,
) {
  return ListTile(
    onTap: () {},
    leading: Container(
      height: 50,
      width: 50,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.fill,
        ),
      ),
    ),
    title: Text(title),
    subtitle: Row(
      children: [
        const SizedBox(
          width: 4.0,
        ),
        Text(
          terlihat,
        ),
      ],
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "",
        ),
        unRead.isNotEmpty && isPinned
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 25,
                height: 25,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.syringe,
                    size: 13,
                  ),
                ),
              )
            : unRead.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      color: isOnline ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    width: 25,
                    height: 25,
                    child: Center(
                      child: Text(
                        unRead,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Text(""),
      ],
    ),
  );
}
