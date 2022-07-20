// ignore_for_file: unused_local_variable, unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
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
        ],
      ),
    );
  }
}

Route _createRoute(
    String urlImage, String title, var time, onOff, String msgs, context) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        message(urlImage, title, onOff, context),
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
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          )
        ],
      );
    },
  );
}

Widget contact(String urlImage, String title, var time, onOff, String msgs,
    context, bool isOnline, String unRead, bool isPinned) {
  return Column(
    children: [
      ListTile(
        onTap: () {
          Navigator.of(context)
              .push(_createRoute(urlImage, title, time, onOff, msgs, context));
        },
        leading: Stack(
          children: [
            Container(
              height: 50,
              width: 50,
              child: ClipOval(
                child: Image.network(
                  urlImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            isOnline
                ? Positioned(
                    top: 35,
                    left: 38,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      width: 12,
                      height: 12,
                    ),
                  )
                : Text(""),
          ],
        ),
        title: Text(title),
        subtitle: Row(
          children: [
            const SizedBox(
              width: 4.0,
            ),
            Text(
              msgs,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            ),
            unRead.isNotEmpty && isPinned
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 25,
                    height: 25,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.syringe,
                        size: 13,
                      ),
                    ),
                  )
                : unRead.isNotEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          color: isOnline ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        width: 25,
                        height: 25,
                        child: Center(
                          child: Text(
                            unRead,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Text(""),
          ],
        ),
      ),
      Divider(
        color: Colors.black.withOpacity(0.1),
      ),
    ],
  );
}

Widget message(String urlImage, String title, String onOff, context) {
  // clickContact
  return Scaffold(
    appBar: AppBar(
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      title: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            child: ClipOval(
              child: Image.network(
                urlImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(
                height: 2,
              ),
              Text(
                onOff,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.call),
        ),
        PopupMenuButton(
          padding: EdgeInsets.zero,
          itemBuilder: (context) => [
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              value: 0,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.volume_up_outlined,
                      color: Colors.grey,
                      //size: 30,
                    ),
                  ],
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    "Senyap",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
              ),
            ),
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              child: Divider(
                thickness: 7,
                color: Color.fromARGB(255, 186, 183, 183).withOpacity(0.1),
              ),
            ),
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              value: 1,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      color: Colors.grey,
                      //size: 30,
                    ),
                  ],
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    "Panggilan Video",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              value: 1,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      //size: 30,
                    ),
                  ],
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    "Cari",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              value: 1,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.brush_outlined,
                      color: Colors.grey,
                      //size: 30,
                    ),
                  ],
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    "Bersihkan Riwayat",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              value: 1,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.colorize_outlined,
                      color: Colors.grey,
                      //size: 30,
                    ),
                  ],
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    "Ganti Warna",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              value: 1,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.grey,
                      //size: 30,
                    ),
                  ],
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    "Hapus Obrolan",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    body: const ChatScr(),
  );
}

class ChatMess extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const ChatMess(
      {Key? key, required this.text, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.now();
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 205, 243, 176),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              children: [
                Text(""),
                Row(
                  children: [
                    Text(
                      dt.hour.toString() + ":" + dt.minute.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.done,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScr extends StatefulWidget {
  const ChatScr({Key? key}) : super(key: key);

  @override
  State<ChatScr> createState() => _ChatScrState();
}

class _ChatScrState extends State<ChatScr> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMess> _messages = [];
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  void _handleSubmitted(String text) {
    _textController.clear();

    var message = ChatMess(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    bool sendMic = false;

    return Container(
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 8.0,
      // ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 50,
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    sendMic = true;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.7),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Pesan',
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 80, maxWidth: 100),
                  suffixIcon: _textController.text == ''
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.attach_file_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.mic_none_outlined,
                              ),
                              onPressed: () => // MODIFIED
                                  _handleSubmitted(
                                      _textController.text) // MODIFIED
                              ,
                            ),
                          ],
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: () => // MODIFIED
                              _handleSubmitted(_textController.text) // MODIFIED
                          ,
                        ),
                ),
                focusNode: _focusNode,
              ),
            ),
          ),
        ],
      ),
    );
  }

// ↓ hold tap position, set during onTapDown, using getPosition() method
  Offset? tapXY;
  // ↓ hold screen size, using first line in build() method
  RenderBox? overlay;
  @override
  Widget build(BuildContext context) {
    overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox?;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/chat_bg.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: Column(
        // MODIFIED
        children: [
          _messages.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: height * 0.24),
                  width: width * 0.65,
                  height: width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.34),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Text(
                        "Belum ada pesan di sini...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: width * 0.07,
                      ),
                      Text(
                        "Kirim pesan dan tekan sambutan di \nbawah.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: width * 0.01,
                      ),
                      SizedBox(
                        child: Image.asset("assets/hi.gif"),
                        height: width * 0.2,
                      ),
                    ],
                  ),
                )
              : Text(""),
          // NEW
          Flexible(
            // NEW
            child: ListView.builder(
              // NEW
              padding: const EdgeInsets.all(8.0), // NEW
              reverse: true, // NEW
              itemBuilder: (_, index) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTapDown: getPosition,
                    onLongPress: () {
                      //FIX pop up menu
                      showMenu<String>(
                        context: context,
                        position: relRectSize,
                        items: [
                          PopupMenuItem<String>(
                            child: Text('Delete'),
                            onTap: () {
                              setState(() {
                                _messages.removeAt(index);
                              });
                            },
                            value: '1',
                          ),
                        ],
                        elevation: 8.0,
                      );
                    },
                    child: _messages[index],
                  ),
                ],
              ), // NEW
              itemCount: _messages.length, // NEW
            ), // NEW
          ), // NEW

          Container(
            child: _buildTextComposer(), // MODIFIED
          ), // NEW
        ], // NEW
      ),
    );
  }

  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY! & const Size(40, 40), overlay!.size);

  // ↓ get the tap position Offset
  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }
}
