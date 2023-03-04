import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'contacts.dart';

class AddContactPage extends StatefulWidget {
  final Group group;
  final Iterable<Contact> contacts;
  final Function(List<Contact>) onContactsSelected;

  AddContactPage({
    required this.group,
    required this.contacts,
    required this.onContactsSelected,
  });

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  List<Contact> selectedContacts = [];

  void _handleCheckbox(bool isChecked, Contact contact) {
    setState(() {
      if (isChecked) {
        selectedContacts.add(contact);
      } else {
        selectedContacts.remove(contact);
      }
    });
  }

  void _handleSave() {
    List<Contact> newContacts = [...widget.contacts, ...selectedContacts];
    widget.onContactsSelected(newContacts);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contacts'),
      ),
      body: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          Contact contact = widget.contacts.elementAt(index);
          bool isChecked = selectedContacts.contains(contact);
          return CheckboxListTile(
            title: Text(contact.displayName ?? ''),
            subtitle: Text(contact.phones?.isNotEmpty == true
                ? contact.phones!.first.value ?? ''
                : ''),
            value: isChecked,
            onChanged: (bool? value) {
              _handleCheckbox(value ?? false, contact);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleSave();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
