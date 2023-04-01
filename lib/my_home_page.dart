import 'package:flutter/material.dart';
import 'package:lookout/firebase_options.dart';
import 'package:lookout/models/ModelProvider.dart';
import 'contacts.dart';
import 'help.dart';
import 'settings.dart';

//**** AWS Amplify ****
// dart async library you will refer to when setting up real time updates
import 'dart:async';

// flutter and ui libraries
import 'package:flutter/material.dart';

// amplify packages you will need to use
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// amplify configuration and models that should have been generated for you
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/Todo.dart';
//****    ****

// Notification imports
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './notifications/controllers/notifications_controller.dart';

// Authentication imports
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

NotificationsController notificationController = NotificationsController();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

////// NOTIFICATIONS TESTING
@override
Widget build(BuildContext context) {
  return Authenticator(
    child: MaterialApp.router(
      builder: Authenticator.builder(),
      title: 'The Quiz App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
////// NOTIFICATIONS TESTING

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    ContactsList(),
    //Contacts(),
    Help(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LookOut'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //fixedColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TimedLookout> _timedlookouts = [];

  // subscription of Todo QuerySnapshots - to be initialized at runtime
  late StreamSubscription<QuerySnapshot<TimedLookout>> _subscription;
  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  @override
  void initState() {
    // kick off app initialization
    _initializeApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  void addItem() {
    setState(() {
      _saveTimedLookout();
    });
  }

  //Saving TimedLookout based on current time FIX ME
  Future<void> _saveTimedLookout() async {
    final newLookout = TimedLookout(
      start: TemporalDateTime.now(),
      length: TemporalTime(DateTime(300)),
    );
    try {
      // to write data to DataStore, you simply pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(newLookout);
      _timedlookouts.add(newLookout);
    } catch (e) {
      safePrint('An error occurred while saving Todo: $e');
    }
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();
    await _configureFirebase();

    // Query and Observe updates to models
    _subscription = Amplify.DataStore.observeQuery(TimedLookout.classType)
        .listen((QuerySnapshot<TimedLookout> snapshot) {
      setState(() {
        if (_isLoading) _isLoading = false;
        _timedlookouts = snapshot.items;
      });
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // amplify plugins
      final _dataStorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      final apiPlugin = AmplifyAPI();
      final authPlugin = AmplifyAuthCognito();
      final analyticsPlugin = AmplifyAnalyticsPinpoint(); // Notifications

      // add Amplify plugins
      if (!Amplify.isConfigured) {
        await Amplify.addPlugins([
          _dataStorePlugin,
          apiPlugin,
          authPlugin,
          analyticsPlugin // Notifications
        ]);
        await Amplify.configure(amplifyconfig);
      }
      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

// Handles messages in the background
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    notificationController = NotificationsController();
    await notificationController.messageHandler(message);
  }

// Initiliazing firebase and the background handler
  Future<void> _configureFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }

    await notificationController.initialize();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 80,
          child: ElevatedButton(
            onPressed: addItem,
            child: Text(
              'Start Timed LookOut',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 80,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Start Interval LookOut',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
        SizedBox(height: 16), // add some spacing between buttons
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: ListView.builder(
              itemCount: _timedlookouts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_timedlookouts[index].start.toString()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
