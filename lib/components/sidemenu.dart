import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/screens/grupBaru/grupBaru.dart';
import 'package:clone_telegram/screens/kontak/contact.dart';
import 'package:clone_telegram/screens/panggilan/panggilan.dart';
import 'package:clone_telegram/screens/pengaturan/pengaturan.dart';
import 'package:clone_telegram/screens/penggunaSekitar/penggunaSekitar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
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
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
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
                        color: selected
                            ? Colors.white
                            : Colors.black.withOpacity(0.1),
                      ),
                      _menuSide(Icons.group_outlined, 'Grup baru', context),
                      _menuSide(Icons.person_outline, 'Kontak', context),
                      _menuSide(Icons.phone_outlined, 'Panggilan', context),
                      _menuSide(
                          Icons.person_pin_circle, 'Pengguna Sekitar', context),
                      _menuSide(
                          Icons.bookmark_outline, 'Pesan Tersimpan', context),
                      _menuSide(Icons.settings_outlined, 'Pengaturan', context),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      _menuSide(Icons.person_add_outlined, 'Pesan Tersimpan',
                          context),
                      _menuSide(Icons.question_mark_outlined, 'Fitur Telegram',
                          context),
                    ],
                  ),
                ),
                // IgnorePointer(
                //   child:
                ListView(
                  // Remove padding
                  shrinkWrap: true,
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
                        color: themeNotifier.isDark
                            ? Color.fromARGB(255, 39, 39, 39)
                            : Color.fromARGB(255, 63, 120, 168),
                      ),
                    ),
                  ],
                ),
                // ),
                Positioned(
                  right: width * 0.04,
                  top: width * 0.1,
                  child: AnimatedIconButton(
                    size: 23,
                    onPressed: () {
                      setState(() {
                        _isMoon = !_isMoon;
                      });
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    },
                    duration: const Duration(milliseconds: 500),
                    splashColor: Colors.transparent,
                    icons: const <AnimatedIconItem>[
                      AnimatedIconItem(
                        icon: Icon(Icons.sunny, color: Colors.white),
                      ),
                      AnimatedIconItem(
                        icon:
                            Icon(Icons.mode_night_rounded, color: Colors.white),
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
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                      ),
                      AnimatedIconItem(
                        icon:
                            Icon(Icons.keyboard_arrow_up, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _menuSide(IconData icon, String textMenu, context) {
  return Container(
    child: ListTile(
      onTap: () {
        if (textMenu == 'Pengaturan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Pengaturan()),
          );
        }
        if (textMenu == 'Kontak') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Contact()),
          );
        }
        if (textMenu == 'Panggilan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Panggilan()),
          );
        }
        if (textMenu == 'Grup baru') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GrupBaru()),
          );
        }
        if (textMenu == 'Pengguna Sekitar') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PenggunaSekitar()),
          );
        }
      },
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
