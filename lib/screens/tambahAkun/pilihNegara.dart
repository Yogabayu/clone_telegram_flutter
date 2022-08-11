import 'package:clone_telegram/provider/negara.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PilihNegara extends StatefulWidget {
  const PilihNegara({Key? key}) : super(key: key);

  @override
  _PilihNegaraState createState() => _PilihNegaraState();
}

class _PilihNegaraState extends State<PilihNegara> {
  late TextEditingController _controller;
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200; // set controller on scrolling

  final List<Map<String, dynamic>> _allDatas = [
    {
      "image": "ID",
      "name": "Indonesia",
      "no": "+62",
    },
    {
      "image": "MT",
      "name": "Malaysia",
      "no": "+xx",
    },
    {
      "image": "LS",
      "name": "Laos",
      "no": "+xx",
    },
    {
      "image": "FP",
      "name": "Filipina",
      "no": "+xx",
    },
    {
      "image": "xxx",
      "name": "isi Sendiri capek gua",
      "no": "+xx",
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

  bool _isChange = false;

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
                : Color.fromARGB(255, 243, 243, 243),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: _isChange
                ? TextField(
                    controller: _controller,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Cari Kontak',
                    ),
                  )
                : Text(
                    "Undang Teman",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.05,
                    ),
                  ),
            actions: [
              _isChange
                  ? SizedBox()
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isChange = true;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
          body: Container(
            width: width,
            height: height,
            child: Column(
              children: [
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
                                onTap: () {
                                  Provider.of<NegaraProvider>(context,
                                          listen: false)
                                      .changeNegara(_datas["image"],
                                          _datas["name"], _datas["no"]);
                                  Navigator.of(context).pop();
                                },
                                leading: Container(
                                  height: 20,
                                  width: 20,
                                  child: ClipOval(
                                    child: Flag.fromCode(
                                      _datas["image"] == 'ID' ||
                                              _datas["image"] == 'id'
                                          ? FlagsCode.ID
                                          : FlagsCode.RU,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _datas["name"].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  _datas["no"].toString(),
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
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
