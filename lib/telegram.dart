import 'package:clone_telegram/screens/Search/customSearch.dart';
import 'package:clone_telegram/components/sidemenu.dart';
import 'package:clone_telegram/screens/chatScreen/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: ListView(
          controller: _scrollController,
          children: [
            contact(
              'https://picsum.photos/seed/mu/200/300',
              'Pinos',
              '19:30',
              'online',
              'Mabar kuy',
              context,
              true,
              "20",
              true,
            ),
            contact(
              'https://picsum.photos/seed/mu/200/300',
              'Pinos',
              '19:30',
              'online',
              'Mabar kuy',
              context,
              true,
              "20",
              true,
            ),
            contact(
              'https://picsum.photos/seed/mu/200/300',
              'Pinos',
              '19:30',
              'online',
              'Mabar kuy',
              context,
              true,
              "20",
              true,
            ),
            contact(
              'https://picsum.photos/seed/kid/200/300',
              'Joni',
              '19:30',
              'terlihat 32 Feb pada 01.05',
              'Mabar kuy',
              context,
              true,
              "20",
              false,
            ),
            contact(
              'https://picsum.photos/seed/man/200/300',
              'Bendot',
              '19:30',
              'online',
              'Minta qwe',
              context,
              false,
              "1",
              false,
            ),
            contact(
              'https://picsum.photos/seed/girl/200/300',
              'Kang Bakso',
              '19:30',
              'online',
              'Anjay mabar',
              context,
              false,
              "",
              false,
            ),
            contact(
              'https://picsum.photos/seed/girl/200/300',
              'Kang Bakso',
              '19:30',
              'online',
              'Anjay mabar',
              context,
              false,
              "",
              false,
            ),
            contact(
              'https://picsum.photos/seed/girl/200/300',
              'Kang Bakso',
              '19:30',
              'online',
              'Anjay mabar',
              context,
              false,
              "",
              false,
            ),
            contact(
              'https://picsum.photos/seed/girl/200/300',
              'Kang Bakso',
              '19:30',
              'online',
              'Anjay mabar',
              context,
              false,
              "",
              false,
            ),
          ],
        ),
      ),
    );
  }
}
