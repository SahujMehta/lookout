// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7ovqaBYqnTP1KeJjBVbCU9trcDD3l-0w',
    appId: '1:643440631861:web:d25490f5beda06194d917c',
    messagingSenderId: '643440631861',
    projectId: 'lookout-382415',
    authDomain: 'lookout-382415.firebaseapp.com',
    storageBucket: 'lookout-382415.appspot.com',
    measurementId: 'G-VMQYM1NBEW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYOkr1IN7QxcwUPP0r1bRHQpbDdcV7qPY',
    appId: '1:643440631861:android:d675c7063840d6734d917c',
    messagingSenderId: '643440631861',
    projectId: 'lookout-382415',
    storageBucket: 'lookout-382415.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDb5YM5bAUHKqlgBnDQmGiRsMBJi8LVjho',
    appId: '1:643440631861:ios:3b2ea7a2ec5ed4d34d917c',
    messagingSenderId: '643440631861',
    projectId: 'lookout-382415',
    storageBucket: 'lookout-382415.appspot.com',
    iosClientId: '643440631861-o15od6atffor6l9dkeeqgdp852e9cm77.apps.googleusercontent.com',
    iosBundleId: 'com.example.lookout',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDb5YM5bAUHKqlgBnDQmGiRsMBJi8LVjho',
    appId: '1:643440631861:ios:3b2ea7a2ec5ed4d34d917c',
    messagingSenderId: '643440631861',
    projectId: 'lookout-382415',
    storageBucket: 'lookout-382415.appspot.com',
    iosClientId: '643440631861-o15od6atffor6l9dkeeqgdp852e9cm77.apps.googleusercontent.com',
    iosBundleId: 'com.example.lookout',
  );
}
