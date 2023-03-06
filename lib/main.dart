import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'my_home_page.dart';
import 'contacts.dart';
import 'help.dart';
import 'settings.dart';
import 'package:permission_handler/permission_handler.dart';

//**** AWS Amplify ****
// dart async library you will refer to when setting up real time updates
import 'dart:async';

// flutter and ui libraries
import 'package:flutter/material.dart';

// amplify packages you will need to use
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

// amplify configuration and models that should have been generated for you
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/Todo.dart';
//****    ****

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.contacts.request();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LookOut',
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
