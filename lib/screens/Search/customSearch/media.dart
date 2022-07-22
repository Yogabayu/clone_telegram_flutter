import 'package:clone_telegram/components/skleton.dart';
import 'package:clone_telegram/model/media.dart';
import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
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
    return Container(
        width: width,
        height: height,
        child: _isLoading ? MediaSkleton() : MediaData());
  }
}

class MediaSkleton extends StatefulWidget {
  MediaSkleton({Key? key}) : super(key: key);

  @override
  State<MediaSkleton> createState() => _MediaSkletonState();
}

class _MediaSkletonState extends State<MediaSkleton> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemCount: itemMedia.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Skleton(
            width: 50,
            height: 50,
          ),
        );
      },
    );
  }
}

class MediaData extends StatelessWidget {
  const MediaData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemCount: itemMedia.length,
      itemBuilder: (context, index) {
        final _itemMedia = itemMedia[index];
        return Container(
          padding: EdgeInsets.all(5),
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(_itemMedia.image + "${index}"),
          ),
        );
      },
    );
  }
}
