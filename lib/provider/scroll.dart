// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//TODO pebaikan floatingActionButton hide belum sleesai
class Scroll extends ChangeNotifier {
  ScrollController scrollController =
      new ScrollController(); // set controller on scrolling
  bool _show = true;

  void showFloationButton() {
    _show = true;
    notifyListeners();
  }

  void hideFloationButton() {
    _show = false;
    notifyListeners();
  }

  void handleScroll() async {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloationButton();
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloationButton();
      }
    });
  }
}
