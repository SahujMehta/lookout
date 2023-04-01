import 'package:flutter/material.dart';
import 'package:lookout/add_interval_lookout.dart';
import 'package:lookout/interval_lookout_check_in.dart';
import 'package:lookout/timed_lookout_check_in.dart';
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
import 'add_timed_lookout.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'TimedLookoutTimer.dart';

class IntervalLookoutTimer extends StatelessWidget {
  const IntervalLookoutTimer({
    required this.intervalLookout,
    Key? key,
  }) : super(key: key);

  final double iconSize = 24.0;
  final IntervalLookout intervalLookout;

  Duration durationParse(String time) {
    final ts = DateFormat('y-MM-dd').format(DateTime.now());
    final dt = DateTime.parse('$ts $time');
    return Duration(hours: dt.hour, minutes: dt.minute, seconds: dt.second);
  }

  @override
  Widget build(BuildContext context) {
    final length = durationParse(intervalLookout.length.toString());
    final endTime =
        DateTime.parse(intervalLookout.start.toString()).toLocal().add(length);
    return Card(
      color: Colors.teal,
      child: InkWell(
        onTap: () {
          Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckInIntervalLookout(intervalLookout: intervalLookout)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:
                      Text(
                        DateFormat("HH:mm").format(endTime), 
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.white),
                      ),
                  ), 
                  Center(
                    child:
                      Text(
                        // "Interval Lookout",
                        intervalLookout.name ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'Roboto', color: Colors.white),
                      ),
                  ),
                  Center(
                    child:
                      Text(
                        // "Interval Lookout",
                        intervalLookout.end.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'Roboto', color: Colors.white),
                      ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
