import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool selected = true;
  bool _isMoon = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            AnimatedPositioned(
              width: selected ? width : width,
              height: selected ? height * 0.8 : height * 0.8,
              top: selected ? width * 0.25 : width * 0.45,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListTile(
                      onTap: () {
                        print("Tambah akun");
                      },
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                            //size: 30,
                          ),
                        ],
                      ),
                      title: const Text('Tambah Akun'),
                    ),
                  ),
                  Divider(
                    color:
                        selected ? Colors.white : Colors.black.withOpacity(0.1),
                  ),
                  _menuSide(Icons.group_outlined, 'Grup baru', context),
                  _menuSide(Icons.person_outline, 'Kontak', context),
                  _menuSide(Icons.phone_outlined, 'Panggilan', context),
                  _menuSide(
                      Icons.person_pin_circle, 'Pengguna Sekitar', context),
                  _menuSide(Icons.bookmark_outline, 'Pesan Tersimpan', context),
                  _menuSide(Icons.settings_outlined, 'Pengaturan', context),
                  Divider(
                    color: Colors.black.withOpacity(0.1),
                  ),
                  _menuSide(
                      Icons.person_add_outlined, 'Pesan Tersimpan', context),
                  _menuSide(
                      Icons.question_mark_outlined, 'Fitur Telegram', context),
                ],
              ),
            ),
            IgnorePointer(
              child: ListView(
                // Remove padding
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('Yoga Bayu'),
                    accountEmail: Text('+62 xxx xxxxxx'),
                    currentAccountPicture: ClipOval(
                      child: Image.network(
                        'https://picsum.photos/seed/man/200/300',
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 63, 120, 168),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: width * 0.04,
              top: width * 0.1,
              child: AnimatedIconButton(
                size: 23,
                onPressed: () {
                  setState(() {
                    _isMoon = !_isMoon;
                  });
                },
                duration: const Duration(milliseconds: 500),
                splashColor: Colors.transparent,
                icons: const <AnimatedIconItem>[
                  AnimatedIconItem(
                    icon: Icon(Icons.sunny, color: Colors.white),
                  ),
                  AnimatedIconItem(
                    icon: Icon(Icons.mode_night_rounded, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              right: width * 0.03,
              top: width * 0.33,
              child: AnimatedIconButton(
                size: 30,
                onPressed: () {
                  setState(() {
                    selected = !selected;
                    print(selected);
                  });
                },
                duration: const Duration(milliseconds: 500),
                splashColor: Colors.transparent,
                icons: const <AnimatedIconItem>[
                  AnimatedIconItem(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  ),
                  AnimatedIconItem(
                    icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _menuSide(IconData icon, String textMenu, context) {
  return Container(
    child: ListTile(
      onTap: () => print(textMenu),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            //size: 30,
          ),
        ],
      ),
      title: Text(textMenu),
    ),
  );
}