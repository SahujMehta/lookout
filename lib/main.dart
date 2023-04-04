import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'my_home_page.dart';
import 'contacts.dart';
import 'help.dart';
import 'settings.dart';
import 'authentication_screen.dart';
import 'add_timed_lookout.dart';

// Permission imports
import 'package:permission_handler/permission_handler.dart';

// Amplify imports
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';

// Authentication imports
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'models/ModelProvider.dart';

// Notification imports
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './notifications/controllers/notifications_controller.dart';
import 'firebase_options.dart';

NotificationsController notificationsController = NotificationsController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  requestContactPermission();
  await _configureAmplify();
  await _configureFirebase();
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
    final pinpointPlugin = AmplifyAnalyticsPinpoint();

    if (!Amplify.isConfigured) {
      await Amplify.addPlugins(
          [_dataStorePlugin, apiPlugin, authPlugin, pinpointPlugin]);
      await Amplify.configure(amplifyconfig);
    }
  } catch (e) {
    safePrint('An error occurred while configuring Amplify: $e');
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  notificationsController = NotificationsController();
  await notificationsController.messageHandler(message);
}

Future<void> _configureFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await notificationsController.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
