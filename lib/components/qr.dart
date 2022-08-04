import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

//TODO qr blm selesai
class Qr extends StatefulWidget {
  const Qr({Key? key}) : super(key: key);

  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/chat_bg.jpg"),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.linearToSrgbGamma(),
        )),
        width: width,
        height: height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: width * 0.17, left: width * 0.02),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.2),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: width * 0.2),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                  width: width * 0.6,
                  height: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      QrImage(
                        foregroundColor: Colors.green,
                        data: 'This QR code has an embedded image as well',
                        version: QrVersions.auto,
                        size: width * 0.5,
                        gapless: false,
                        embeddedImage: AssetImage('assets/telegram.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: Size(30, 30),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Text(
                        "@YOGABAYUAP",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: width * 0.22,
                  top: width * 0.12,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/seed/girl/200/300',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
