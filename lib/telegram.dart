import 'package:clone_telegram/screens/Search/customSearch.dart';
// import 'package:clone_telegram/components/searchBar.dart';
import 'package:clone_telegram/components/sidemenu.dart';
import 'package:clone_telegram/screens/chatScreen/chatScreen.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue[300],
        child: FaIcon(FontAwesomeIcons.pen),
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
      body: ChatScreen(),
    );
  }
}
