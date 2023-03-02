import 'package:flutter/material.dart';

class CollapsibleCard extends StatefulWidget {
  final String title;
  final String content;

  CollapsibleCard({required this.title, required this.content});

  @override
  _CollapsibleCardState createState() => _CollapsibleCardState();
}

class _CollapsibleCardState extends State<CollapsibleCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            isExpanded: _isExpanded,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(widget.title),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.content),
            ),
          ),
        ],
      ),
    );
  }
}
