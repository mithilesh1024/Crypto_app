import 'package:crypto_app/screeen/homepage.dart';
import 'package:crypto_app/screeen/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode,_) {
        return MaterialApp(
          title: 'Crypto App',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: HomePage(),
          routes: {
            "/home": (_) => HomePage(),
            "/setting": (_) => SettingsPage()
          },
        );
      },
    );
  }
}
