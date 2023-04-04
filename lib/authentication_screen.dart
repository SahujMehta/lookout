import 'dart:async';
import 'package:flutter/material.dart';
import 'navigation/router.dart';

// Authentication imports
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:lookout/my_home_page.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, '/home');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        title: 'Please Login to Lookout',
        theme: new ThemeData(
            primarySwatch: Colors.teal, canvasColor: const Color(0xff241181)),
      ),
    );
  }
}
