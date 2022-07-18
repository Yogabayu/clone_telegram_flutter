import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/screens/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _notifier = ValueNotifier<ThemeModel>(ThemeModel(ThemeMode.light));
    // // return ChangeNotifierProvider(
    // //   create: (_) => ThemeNotifier(),
    // //   child: Consumer<ThemeNotifier>(
    // //       builder: (context, ThemeNotifier themeNotifier, child) {
    // //     return MaterialApp(
    // //       title: 'Telegram Clone',
    // //       theme: themeNotifier.darkTheme ? light : dark,
    // //       home: SplashScreen(),
    // //     );
    // //   }),
    // // );
    // return ValueListenableBuilder<ThemeModel>(
    //   valueListenable: _notifier,
    //   builder: (_, model, __) {
    //     final mode = model.mode;
    //     return MaterialApp(
    //       theme: ThemeData.light(), // Provide light theme.
    //       darkTheme: ThemeData.dark(), // Provide dark theme.
    //       themeMode: mode, // Decides which theme to show.
    //       home: SplashScreen(),
    //     );
    //   },
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram clone',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const SplashScreen(),
    );
  }
}
