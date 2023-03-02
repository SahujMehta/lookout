import 'package:flutter/material.dart';
import 'collapsible_list.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: CollapsibleCard(
            title: 'What is an Interval LookOut?',
            content:
                'An Interval LookOut allows you to set a specific time interval to check in for a given \'event\'. Simply set the interval length and duration, write a short description, select the contacts to be contacted if you miss a check in and click start.',
          ),
        ),
        ListTile(
          title: CollapsibleCard(
            title: 'What is a Timed LookOut?',
            content:
                'A Timed LookOut allows you to set a specific time to check in for a given \'event\'. Simply set the check in time, write a short description, select the contacts to be contacted if you miss a check in and click start.',
          ),
        ),
        ListTile(
          title: CollapsibleCard(
            title: 'What happens if I miss a check in?',
            content:
                'If a check in is missed, the contacts you assigned for the LookOut, along with your emergency contacts will be contacted. If they have the app, their phone will ring to inform them. Otherwise, they will receive a text to our website. It is only at this point that your location is shared.',
          ),
        ),
        ListTile(
          title: CollapsibleCard(
            title: 'How does checking in work?',
            content:
                'To check in, simply open the app, and type in your pin. You have two pins, one to deactivate the timed LookOut or check in for an interval LookOut, the other raises a silent alarm and notifies your contacts for the event. Don\'t share these pins, doing so compromises the silent alarm system.',
          ),
        ),
        ListTile(
            title: CollapsibleCard(
          title: 'What is the silent alarm?',
          content:
              'The silent alarm is a feature that allows you to raise an alarm without alerting the people you are with. This is useful if you are in a situation where you need to alert your contacts, but don\'t want to alert the people you are with. To use this feature, simply open the app, and type in your silent alarm pin. This will notify your contacts for the event, but will not alert the people you are with.',
        )),
        ListTile(
          title: CollapsibleCard(
            title: 'What is a GeoFence?',
            content:
                'A GeoFence is a location such as your home, that automatically deactivates any active LookOuts. This feature maybe useful, if for example, you are a frequent runner..',
          ),
        ),
      ],
    );
  }
}
