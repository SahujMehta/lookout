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

class CheckInIntervalLookout extends StatefulWidget {
  const CheckInIntervalLookout({required this.intervalLookout, Key? key}) : super(key: key);
  final IntervalLookout intervalLookout;
  @override
  State<CheckInIntervalLookout> createState() => _CheckInIntervalLookoutState();
}

class _CheckInIntervalLookoutState extends State<CheckInIntervalLookout> {

  void _deleteIntervalLookout(BuildContext context) async {
    try {
      await Amplify.DataStore.delete(widget.intervalLookout);
    } catch (e) {
      safePrint('An error occurred while deleting Interval Lookout: $e');
    }
  }

  void _updateIntervalLookout() async {
    final newIntervalLookout = widget.intervalLookout.copyWith(start: TemporalDateTime(DateTime.now()));
    try {
      await Amplify.DataStore.save(newIntervalLookout);
    } catch (e) {
      safePrint('An error occurred while saving Interval Lookout: $e');
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
                       _checkInterval(context);
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

  void _checkInterval(BuildContext context) {
    Duration interval = durationParse(widget.intervalLookout.length.toString());
    DateTime currentTime = DateTime.now();
    final nextIntervalEnd = currentTime.add(interval);
    DateTime endTime = DateTime.parse(widget.intervalLookout.end.toString()).toLocal();

    //nextIntervalEnd is after endTime
    if(nextIntervalEnd.compareTo(endTime) > 0){
      _deleteIntervalLookout(context);
    }
    else {
      _updateIntervalLookout();
    }
  }

  Duration durationParse(String time) {
    final ts = DateFormat('y-MM-dd').format(DateTime.now());
    final dt = DateTime.parse('$ts $time');
    return Duration(hours: dt.hour, minutes: dt.minute, seconds: dt.second);
  }
}