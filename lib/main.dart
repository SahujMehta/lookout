import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'my_home_page.dart';
import 'contacts.dart';
import 'help.dart';
import 'settings.dart';
import 'authentication_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'add_timed_lookout.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'models/ModelProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  requestContactPermission();
  await _configureAmplify();
  runApp(MyApp());
}

Future<void> requestContactPermission() async {
  var status = await Permission.contacts.status;
  if (status.isDenied) {
    await Permission.contacts.request();
  }
}

// Initial configuration settings
Future<void> _configureAmplify() async {
  try {
    final _dataStorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    final apiPlugin = AmplifyAPI();
    final authPlugin = AmplifyAuthCognito();

    if (!Amplify.isConfigured) {
      await Amplify.addPlugins([_dataStorePlugin, apiPlugin, authPlugin]);
      await Amplify.configure(amplifyconfig);
    }
  } catch (e) {
    safePrint('An error occurred while configuring Amplify: $e');
  }
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
        '/authentication': (context) => AuthenticationScreen(),
        '/home': (context) => MyHomePage(),
        '/contacts': (context) => ContactsList(),
        '/help': (context) => Help(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
