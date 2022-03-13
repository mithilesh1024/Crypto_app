import 'package:crypto_app/screeen/homepage.dart';
import 'package:crypto_app/screeen/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // themeNotifier is used to check is dark mode is activated or deactivated. Initial value of dark mode is deactivated.
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(   // This will listen to any change in themeNotifier
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
