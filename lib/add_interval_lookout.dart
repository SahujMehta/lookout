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


class AddIntervalLookout extends StatefulWidget {
  const AddIntervalLookout({Key? key}) : super(key: key);

  @override
  State<AddIntervalLookout> createState() => _AddIntervalLookoutState();
}

class _AddIntervalLookoutState extends State<AddIntervalLookout> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _emailController;

  Duration duration = Duration(hours: 0);
  DateTime endDate = DateTime.now();
  DateTime endTime = DateTime.now();

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _emailController.dispose();
  }

  Future<void> _saveIntervalLookout() async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final email = _emailController.text;

    final dur_time =
        DateFormat('H:mm').parse(duration.toString().substring(0, 4));
    final length = dur_time.add(dur_time.timeZoneOffset);
    final start = TemporalDateTime(DateTime.now());
//     final toUTC = DateTime(selectedDate.year, selectedDate.month, selectedDate.year, 
// selectedTime.hour, selectedTime.minute);
    final endDateTime = DateTime(endDate.year, endDate.month, endDate.day, endTime.hour, endTime.minute);

    final newTimer = IntervalLookout(
      start: start,
      length: TemporalTime(length),
      name: title,
      description: description,
      end: TemporalDateTime(endDateTime),
      email: email
    );
    try {
      await Amplify.DataStore.save(newTimer);
      if (mounted) {
        Navigator.of(context).pop();
      }
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
          'Add Interval Lookout',
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
                    Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(color: Colors.teal, fontSize: 25)
                        ),
                        SizedBox(width: 53,),
                        Expanded(
                        child:
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _titleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                              filled: true,
                              fillColor: Color.fromARGB(255, 243, 243, 243),
                              hintText: 'Name',),
                        )),
                    ]),
                  SizedBox(height: 15),
                  Row(
                    children: [
                    Text(
                      'Interval:',
                      style: TextStyle(
                          color: Colors.teal, fontSize: 25, fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: 39,),
                    Expanded(
                      child:
                    InkWell(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildContainer(timerPicker());
                            });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey.shade700),
                          color: Color.fromARGB(255, 243, 243, 243)
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
                  SizedBox(height: 15),
                  Row(
                    children: [
                    Text(
                      'End Time:',
                      style: TextStyle(
                          color: Colors.teal, fontSize: 25, fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: 19,),
                    Expanded(
                      child:
                    InkWell(
                      onTap: () {
                        _showTimePicker(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey.shade700),
                          color: Color.fromARGB(255, 243, 243, 243)
                        ),
                        child: 
                        Center(
                          child:
                            Text(
                              DateFormat('HH:mm').format(endTime),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    )),
                  ]),
                  SizedBox(height: 15),
                  Row(
                    children: [
                    Text(
                      'End Date:',
                      style: TextStyle(
                          color: Colors.teal, fontSize: 25, fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: 23,),
                    Expanded(
                      child:
                    InkWell(
                      onTap: () {
                        _showDatePicker(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey.shade700),
                          color: Color.fromARGB(255, 243, 243, 243)
                        ),
                        child: 
                        Center(
                          child:
                            Text(
                              DateFormat('MM-dd-y').format(endDate),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                      ),
                    )),
                  ]),
                  SizedBox(height: 15),
                  Row(
                      children: [
                        Text(
                          "Contact:",
                          style: TextStyle(color: Colors.teal, fontSize: 25)
                        ),
                        SizedBox(width: 33,),
                        Expanded(
                        child:
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                              filled: true,
                              fillColor: Color.fromARGB(255, 243, 243, 243),
                              hintText: 'Email Address',),
                        )),
                    ]),
                  SizedBox(height: 20,),
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
                    minLines: 4,
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 243, 243, 243),
                        hintText: 'Enter a short description to be sent to contacts if a check in is missed.',),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _saveIntervalLookout,
                    child: const Text('Start'),
                  )
                ],
              ),
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

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            endDate = val;
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  void _showTimePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            endTime = val;
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }
}