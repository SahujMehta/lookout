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
  List<TimedLookout> _timedLookouts = [];

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

  Future<void> _initializeApp() async {
    await _configureAmplify();
    _subscription = Amplify.DataStore.observeQuery(TimedLookout.classType)
        .listen((QuerySnapshot<TimedLookout> snapshot) {
      setState(() {
        _timedLookouts = snapshot.items;
      });
    });
  }

  Future<void> _configureAmplify() async {
    try {
      final _dataStorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      final apiPlugin = AmplifyAPI();
      await Amplify.addPlugins([_dataStorePlugin, apiPlugin]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

  final List<String> items = [];

  void addItem() {
    setState(() {
      items.add(DateTime.now().toString());
    });
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
              child: ListView(
                  children: _timedLookouts
                      .map((timedLookout) =>
                          TimedLookoutTimer(timedLookout: timedLookout))
                      .toList())),
        ),
      ],
    );
  }
}

class TimedLookoutTimer extends StatelessWidget {
  const TimedLookoutTimer({
    required this.timedLookout,
    Key? key,
  }) : super(key: key);

  final double iconSize = 24.0;
  final TimedLookout timedLookout;

  void _deleteTimedLookout(BuildContext context) async {
    try {
      await Amplify.DataStore.delete(timedLookout);
    } catch (e) {
      safePrint('An error occurred while deleting Timed Lookout: $e');
    }
  }

  Duration durationParse(String time) {
    final ts = DateFormat('y-MM-dd').format(DateTime.now());
    final dt = DateTime.parse('$ts $time');
    return Duration(hours: dt.hour, minutes: dt.minute, seconds: dt.second);
  }

  @override
  Widget build(BuildContext context) {
    final length = durationParse(timedLookout.length.toString());
    final end_time =
        DateTime.parse(timedLookout.start.toString()).toLocal().add(length);
    return Card(
      color: Colors.teal,
      child: InkWell(
        onTap: () {
          _deleteTimedLookout(context);
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
                        DateFormat("HH:mm").format(end_time), 
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.white),
                      ),
                  ), 
                  Center(
                    child:
                      Text(
                        "Timed Lookout",
                        // timedLookout.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'Roboto', color: Colors.white),
                      ),
                  ),                                   
                  // Text(
                  //   DateTime.parse(timedLookout.expire_time.toString())
                  //       .toLocal()
                  //       .toString(),
                  // ),
                  // Text(timedLookout.description ?? ''),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class AddTimedLookout extends StatefulWidget {
  const AddTimedLookout({Key? key}) : super(key: key);

  @override
  State<AddTimedLookout> createState() => _AddTimedLookoutState();
}

class _AddTimedLookoutState extends State<AddTimedLookout> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;
  late final TextEditingController _durationController;

  late double _height;
  late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  Duration duration = Duration(hours: 1);

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       initialDatePickerMode: DatePickerMode.day,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() {
  //       selectedDate = picked;
  //       _dateController.text = DateFormat.yMd().format(selectedDate);
  //     });
  //   }
  // }

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       selectedTime = picked;
  //       _hour = selectedTime.hour.toString();
  //       _minute = selectedTime.minute.toString();
  //       _time = _hour + ' : ' + _minute;
  //       _timeController.text = _time;
  //       _timeController.text = formatDate(
  //           DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
  //           [hh, ':', nn, " ", am]).toString();
  //     });
  //   }
  // }

  // Future<void> _selectTime(BuildContext context) async {
  //   showCupertinoModalPopup<void>(
  //       context: context,
  //       builder: (BuildContext context) => Container(
  //         height: 216,
  //         padding: const EdgeInsets.only(top: 6.0),
  //         // The bottom margin is provided to align the popup above the system
  //         // navigation bar.
  //         margin: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         // Provide a background color for the popup.
  //         color: CupertinoColors.systemBackground.resolveFrom(context),
  //         // Use a SafeArea widget to avoid system overlaps.
  //         child: SafeArea(
  //           top: false,
  //           child: child,
  //         ),
  //       ));
  // }

  Future<void> _saveTimedLookout() async {
    // get the current text field contents
    final title = _titleController.text;
    final description = _descriptionController.text;
    final date = _dateController.text;
    final time = _timeController.text;
    final formatedDate = DateFormat('MM/dd/yyyy hh:mm a').parse('$date $time');

    final dur_time =
        DateFormat('H:mm').parse(duration.toString().substring(0, 4));
    final length = dur_time.add(dur_time.timeZoneOffset);
    final start = TemporalDateTime(DateTime.now());
    // create a new Todo from the form values
    // `isComplete` is also required, but should start false in a new Todo
    // final newTimer = TimedLookout(
    //   title: title,
    //   expire_time: TemporalDateTime(formatedDate),
    //   description: description.isNotEmpty ? description : null,
    // );
    final newTimer = TimedLookout(
      start: start,
      length: TemporalTime(length),
    );
    try {
      // to write data to DataStore, you simply pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(newTimer);
      // after creating a new Todo, close the form
      // Be sure the context at that moment is still valid and mounted
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      safePrint('An error occurred while saving Timed Lookout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Timed Lookout',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Row(
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(color: Colors.teal, fontSize: 25)
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                    child:
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: _titleController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                          // enabledBorder: UnderlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.white)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Name',),
                    )),
                ]),
              SizedBox(height: 15),
             
              // SizedBox(height: 15),
              // const Text(
              //   'Date',
              //   style: TextStyle(
              //       color: Colors.white, fontSize: 15, fontFamily: 'Roboto'),
              // ),
              // InkWell(
              //   onTap: () {
              //     _selectDate(context);
              //   },
              //   child: Container(
              //     width: _width / 1.7,
              //     height: _height / 15,
              //     margin: EdgeInsets.only(top: 15),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(color: Colors.grey[200]),
              //     child: TextFormField(
              //       style: const TextStyle(fontSize: 25),
              //       textAlign: TextAlign.center,
              //       enabled: false,
              //       keyboardType: TextInputType.text,
              //       controller: _dateController,
              //       onSaved: (String? val) {
              //         _setDate = val!;
              //       },
              //       decoration: const InputDecoration(
              //           disabledBorder:
              //               UnderlineInputBorder(borderSide: BorderSide.none),
              //           // labelText: 'Time',
              //           contentPadding: EdgeInsets.only(top: 0.0)),
              //     ),
              //   ),
              // ),
              SizedBox(height: 15),
              Row(
                children: [
                Text(
                  'Time:',
                  style: TextStyle(
                      color: Colors.teal, fontSize: 25, fontFamily: 'Roboto'),
                ),
                SizedBox(width: 25,),
                Expanded(
                  child:
                InkWell(
                  onTap: () {
                    // _selectTime(context);
                    showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildContainer(timerPicker());
                        });
                  },
                  // child: Container(
                  //   margin: EdgeInsets.only(top: 15),
                  //   width: _width / 1.7,
                  //   height: _height / 15,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(color: Colors.grey[200]),
                  //   child: TextFormField(
                  //     style: TextStyle(fontSize: 25),
                  //     textAlign: TextAlign.center,
                  //     onSaved: (String? val) {
                  //       _setTime = val!;
                  //     },
                  //     enabled: false,
                  //     keyboardType: TextInputType.text,
                  //     controller: _timeController,
                  //     decoration: const InputDecoration(
                  //         disabledBorder:
                  //             UnderlineInputBorder(borderSide: BorderSide.none),
                  //         // labelText: 'Time',
                  //         contentPadding: EdgeInsets.all(5)),
                  //   ),
                  // ),

                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                    ),
                    child: 
                    Center(
                      child:
                        Text(
                          duration.toString().substring(0, 4),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                )),
              ]),
              SizedBox(height: 15,),
              Center(
                child:
                  Text(
                    "Short Description:",
                    style: TextStyle(color: Colors.teal, fontSize: 25, fontFamily: 'Roboto'),
                  )
              ),
              SizedBox(height: 5,),
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _descriptionController,
                minLines: 2,
                maxLines: 3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    // enabledBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.white)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter a short description to be sent to contacts if a check in is missed.',),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: _saveTimedLookout,
                child: const Text('Start'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget timerPicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 1,
      initialTimerDuration: duration,
      onTimerDurationChanged: (Duration changeTimer) {
        setState(() {
          duration = changeTimer;
        });
      },
    );
  }

  Widget _buildContainer(Widget picker) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
