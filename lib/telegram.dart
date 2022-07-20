import 'package:clone_telegram/components/customSearch.dart';
// import 'package:clone_telegram/components/searchBar.dart';
import 'package:clone_telegram/components/sidemenu.dart';
import 'package:clone_telegram/screens/chatScreen/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 100),
    reverseTransitionDuration: Duration(milliseconds: 100),
    pageBuilder: (context, animation, secondaryAnimation) => CustomSearch(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: <Widget>[
          //exit
          SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: const Offset(-1.0, 0.0),
            ).animate(animation),
            child: child,
          ),
          //enter page
          SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, -1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          )
        ],
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
