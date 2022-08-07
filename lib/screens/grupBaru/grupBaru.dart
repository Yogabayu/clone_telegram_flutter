import 'package:clone_telegram/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrupBaru extends StatefulWidget {
  const GrupBaru({Key? key}) : super(key: key);

  @override
  _GrupBaruState createState() => _GrupBaruState();
}

class _GrupBaruState extends State<GrupBaru> {
  late TextEditingController _controller;
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200; // set controller on scrolling

  final List<Map<String, dynamic>> _allDatas = [
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Andy",
      "status": "terlihat seminggu yang lalu"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Aragon",
      "status": "terlihat 23 Apr pada 14:04"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Bob",
      "status": "terlihat sejuta tahun yang lalu"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Barbara",
      "status": "tidak terlihat"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Candy",
      "status": "ya ndaktau kok tanya saya"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Colin",
      "status": "terlihat seminggu yang lalu"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Audra",
      "status": "terlihat seminggu yang lalu"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Banana",
      "statuas": "terlihat seminggu yang lalu"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Caversky",
      "status": "terlihat seminggu yang lalu"
    },
    {
      "image": "https://picsum.photos/200/300?random=",
      "name": "Becky",
      "status": "terlihat seminggu yang lalu"
    },
  ];

  List<Map<String, dynamic>> _foundData = [];
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allDatas;
    } else {
      results = _allDatas
          .where((data) =>
              data["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundData = results;
    });
  }

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
    _foundData = _allDatas;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            title: ListTile(
              title: Text(
                "Grup Baru",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
              subtitle: Text(
                "hingga 200000 anggota",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                ),
              ),
            ),
          ),
          body: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(93, 255, 255, 255),
                      ),
                    ),
                    hintText: 'Siapa yang ingin Anda tambahkan?',
                  ),
                ),
                Expanded(
                  child: _foundData.isNotEmpty
                      ? RawScrollbar(
                          controller: _scrollController,
                          thumbColor: Colors.grey,
                          thickness: 6,
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: _foundData.length,
                            itemBuilder: (_, index) {
                              final _datas = _foundData[index];
                              return ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  child: ClipOval(
                                    child: Image.network(
                                      _datas["image"] + "${index}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _datas["name"].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(_datas["status"].toString()),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/duck.gif",
                                  fit: BoxFit.cover,
                                ),
                                height: width * 0.3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tidak ada Hasil',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
