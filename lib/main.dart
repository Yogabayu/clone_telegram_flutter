import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/provider/qr_provider.dart';
import 'package:clone_telegram/screens/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QrController(),
        ),
        ListenableProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            title: 'Telegram Clone',
            theme: themeNotifier.isDark
                ? ThemeData.dark()
                : ThemeData(primarySwatch: Colors.blueGrey),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );

    // return ChangeNotifierProvider(
    //   create: (_) => ThemeModel(),
    //   child: Consumer<ThemeModel>(
    //     builder: (context, ThemeModel themeNotifier, child) {
    //       return MaterialApp(
    //         title: 'Telegram Clone',
    //         theme: themeNotifier.isDark
    //             ? ThemeData.dark()
    //             : ThemeData(primarySwatch: Colors.blueGrey),
    //         debugShowCheckedModeBanner: false,
    //         home: SplashScreen(),
    //       );
    //     },
    //   ),
    // );
  }
}
