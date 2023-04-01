import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'add_timed_lookout.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'models/ModelProvider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          signOutCurrentUser();
        },
        child: Text(
          'Log Out',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
    );
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
