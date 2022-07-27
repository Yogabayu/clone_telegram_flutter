import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/screens/Search/customSearch.dart';
import 'package:clone_telegram/components/sidemenu.dart';
import 'package:clone_telegram/screens/chatScreen/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 100),
    reverseTransitionDuration: Duration(milliseconds: 100),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CustomSearch(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Telegram extends StatefulWidget {
  const Telegram({Key? key}) : super(key: key);

  @override
  _TelegramState createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
  ScrollController _scrollController =
      new ScrollController(); // set controller on scrolling
  bool _show = true;

  Duration duration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    handleScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloationButton() {
    setState(() {
      _show = true;
    });
  }

  void handleScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloationButton();
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloationButton();
      }
    });
  }

  void hideFloationButton() {
    setState(() {
      _show = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _show ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _show ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: Colors.blue[300],
            child: FaIcon(FontAwesomeIcons.pen),
          ),
        ),
      ),
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Telegram"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      // body: ChatScreen(),
      body: Container(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 12,
          itemBuilder: (context, index) {
            if (index == 0 || index == 1) {
              return contact(
                'https://picsum.photos/seed/user/200/300',
                'User ${index}',
                '0${index}:00',
                'online',
                'Status User${index}',
                context,
                true,
                "20",
                true,
              );
            }
            if (index == 2 || index == 3) {
              return contact(
                'https://picsum.photos/seed/user/200/300',
                'Grup ${index}',
                '0${index}:00',
                'offline',
                'Status User${index}',
                context,
                false,
                "17",
                false,
              );
            }
            if (index == 4 || index == 5) {
              return contact(
                'https://picsum.photos/seed/user/200/300',
                'User ${index}',
                '0${index}:00',
                'online',
                'Status User${index}',
                context,
                true,
                "20",
                false,
              );
            } else {
              return contact(
                'https://picsum.photos/seed/girl/200/300',
                'Kang Bakso',
                '19:30',
                'online',
                'Anjay mabar',
                context,
                true,
                "",
                false,
              );
            }
          },
        ),
      ),
    );
  }
}
