import 'package:clone_telegram/components/skleton.dart';
import 'package:flutter/material.dart';

class Tautan extends StatefulWidget {
  @override
  State<Tautan> createState() => _TautanState();
}

class _TautanState extends State<Tautan> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        _isLoading
            // ? Center(
            //     child: TautanSkleton(),
            //   )

            ? Container(
                width: width,
                height: height,
                child: ListView.separated(
                  itemCount: _tautanItems.length,
                  itemBuilder: (context, index) {
                    return TautanSkleton();
                  },
                  separatorBuilder: (xontext, index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                ),
              )
            : Container(
                width: width,
                height: height * 0.8,
                child: ListView.builder(
                  itemCount: _tautanItems.length,
                  itemBuilder: (context, index) {
                    var _items = _tautanItems[index];
                    return ListTile(
                      isThreeLine: true,
                      leading: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey.withOpacity(0.3),
                        child: Center(
                          child: Text(
                            _items.image,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        _items.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _items.subtitle1,
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(_items.subtitle2),
                          Divider(),
                        ],
                      ),
                      trailing: Text(
                        _items.trailing,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}

class TautanSkleton extends StatelessWidget {
  const TautanSkleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Skleton(
        height: 50,
        width: 50,
      ),
      title: Skleton(
        width: 50,
        height: 15,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Skleton(
            width: 200,
            height: 10,
          ),
          SizedBox(
            height: 5,
          ),
          Skleton(
            width: 100,
            height: 10,
          ),
        ],
      ),
    );
  }
}

class TautanItem {
  final String image, title, subtitle1, subtitle2, trailing;
  TautanItem({
    required this.image,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.trailing,
  });
}

List<TautanItem> _tautanItems = [
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
  TautanItem(
    image: "S",
    title: "Shopee",
    subtitle1: "http://google.com",
    subtitle2: "Grup Shopee",
    trailing: "16.37",
  ),
];
