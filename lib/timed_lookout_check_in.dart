import 'package:flutter/material.dart';
import 'contacts.dart';
import 'help.dart';
import 'settings.dart';
import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_api/amplify_api.dart';

class CheckInTimedLookout extends StatefulWidget {
  const CheckInTimedLookout({required this.timedLookout, Key? key}) : super(key: key);
  final TimedLookout timedLookout;
  @override
  State<CheckInTimedLookout> createState() => _CheckInTimedLookoutState();
}

class _CheckInTimedLookoutState extends State<CheckInTimedLookout> {

  void _deleteTimedLookout(BuildContext context) async {
    try {
      await Amplify.DataStore.delete(widget.timedLookout);
    } catch (e) {
      safePrint('An error occurred while deleting Timed Lookout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Check In',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: 
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    // controller: _titleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 243, 243, 243),
                        hintText: 'Pin',),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       _deleteTimedLookout(context);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Enter'),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}