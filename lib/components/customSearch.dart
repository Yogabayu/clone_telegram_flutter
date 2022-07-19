//TODO belum selesai customsearch
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.grey,
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
                      fontStyle: FontStyle.italic,
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
            indicatorPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            indicatorWeight: 5,
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
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Media",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                "Unduhan",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                "Tautan",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(
              child: Text('This is Obrolan screen.'),
            ),
            const Center(
              child: Text('This is Media screen.'),
            ),
            const Center(
              child: Text('This is Unduhan screen.'),
            ),
            const Center(
              child: Text('This is Tautan screen.'),
            ),
          ],
        ),
      ),
    );
  }
}
