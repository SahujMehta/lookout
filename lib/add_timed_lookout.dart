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


class AddTimedLookout extends StatefulWidget {
  const AddTimedLookout({Key? key}) : super(key: key);

  @override
  State<AddTimedLookout> createState() => _AddTimedLookoutState();
}

class _AddTimedLookoutState extends State<AddTimedLookout> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  Duration duration = Duration(hours: 1);

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  Future<void> _saveTimedLookout() async {
    final title = _titleController.text;
    final description = _descriptionController.text;

    final dur_time =
        DateFormat('H:mm').parse(duration.toString().substring(0, 4));
    final length = dur_time.add(dur_time.timeZoneOffset);
    final start = TemporalDateTime(DateTime.now());

    final newTimer = TimedLookout(
      start: start,
      length: TemporalTime(length),
    );
    try {
      await Amplify.DataStore.save(newTimer);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      safePrint('An error occurred while saving Timed Lookout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Name',),
                    )),
                ]),
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