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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
  late StreamSubscription<QuerySnapshot<TimedLookout>> _subscription;
  late StreamSubscription<QuerySnapshot<IntervalLookout>> _intervalSubscription;
  List<TimedLookout> _timedLookouts = [];
  List<IntervalLookout> _intervalLookouts = [];
  List<Widget> timerList = [];
  late Timer updateTimer;

  @override
  void initState() {
    // kick off app initialization
    _initializeApp();
    super.initState();
    updateTimer = Timer.periodic(const Duration(seconds: 1), (timer) => generateTimerList());
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
    _intervalSubscription.cancel();
    updateTimer.cancel();
  }

  Future<void> _initializeApp() async {
    await _configureAmplify();
    _subscription = Amplify.DataStore.observeQuery(TimedLookout.classType)
        .listen((QuerySnapshot<TimedLookout> snapshot) {
      setState(() {
        _timedLookouts = snapshot.items;
      });
    });
    _intervalSubscription = Amplify.DataStore.observeQuery(IntervalLookout.classType)
        .listen((QuerySnapshot<IntervalLookout> snapshot) {
      setState(() {
        _intervalLookouts = snapshot.items;
      });
    });
  }

  Future<void> _configureAmplify() async {
    try {
      final _dataStorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      final apiPlugin = AmplifyAPI();
      final authPlugin = AmplifyAuthCognito();
      await Amplify.addPlugins([_dataStorePlugin, apiPlugin, authPlugin]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    generateTimerList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 80,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddTimedLookout()),
              );
            },
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddIntervalLookout()),
              );
            },
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
              child: ListView(
                  children: timerList
              )),
        ),
      ],
    );
  }

  void generateTimerList() {
    setState(() {
      timerList = [..._timedLookouts
                      .map((timedLookout) =>
                          TimedLookoutTimer(timedLookout: timedLookout))
                      .toList(),
                      ..._intervalLookouts
                      .map((intervalLookout) =>
                          IntervalLookoutTimer(intervalLookout: intervalLookout))
                      .toList()
                  ];
    });
  }
}

class TimedLookoutTimer extends StatelessWidget {
  const TimedLookoutTimer({
    required this.timedLookout,
    Key? key,
  }) : super(key: key);

  final double iconSize = 24.0;
  final TimedLookout timedLookout;

  Duration durationParse(String time) {
    final ts = DateFormat('y-MM-dd').format(DateTime.now());
    final dt = DateTime.parse('$ts $time');
    return Duration(hours: dt.hour, minutes: dt.minute, seconds: dt.second);
  }

  @override
  Widget build(BuildContext context) {
    final length = durationParse(timedLookout.length.toString());
    final endTime =
        DateTime.parse(timedLookout.start.toString()).toLocal().add(length);
    Duration timeUntilDuration = endTime.difference(DateTime.now());
    String timeUntil = "";
    if(timeUntilDuration.inHours.toString() == "0") {
      timeUntil = "${timeUntilDuration.inMinutes.remainder(60)} min until Check In";
    }
    else {
      timeUntil = "${timeUntilDuration.inHours} Hr ${timeUntilDuration.inMinutes.remainder(60)} Min Until Check In";
    }

    return Card(
      color: Colors.teal,
      child: InkWell(
        onTap: () {
          Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckInTimedLookout(timedLookout: timedLookout)),
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
                        // "${timeUntilDuration.inHours}:${timeUntilDuration.inMinutes.remainder(60)}",
                        timeUntil,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.white),
                      )
                  ),
                  Center(
                    child:
                      Text(
                        "end time: ${DateFormat("HH:mm").format(endTime)}",
                        // DateFormat("HH:mm").format(endTime), 
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.white),
                      ),
                  ), 
                  SizedBox(height: 2),
                  Center(
                    child:
                      Text(
                        // "Timed Lookout",
                        timedLookout.name ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 17, fontFamily: 'Roboto', color: Colors.white),
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

