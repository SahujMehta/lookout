import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'my_home_page.dart';
import 'contacts.dart';
import 'help.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: new ThemeData(
          primarySwatch: Colors.teal, canvasColor: const Color(0xff241181)),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(),
        '/contacts': (context) => Contacts(),
        '/help': (context) => Help(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
