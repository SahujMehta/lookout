import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    getContactsPermission();
  }

  void getContactsPermission() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      loadContacts();
    }
  }

  void loadContacts() async {
    Iterable<Contact> contactsIterable = await ContactsService.getContacts();
    setState(() {
      contacts = contactsIterable.toList();
      filteredContacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search contacts',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filteredContacts = contacts
                      .where((contact) =>
                          contact.displayName
                              ?.toLowerCase()
                              .contains(value.toLowerCase()) ??
                          false)
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                Contact contact = filteredContacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(contact.phones?.isNotEmpty == true
                      ? contact.phones!.first.value ?? ''
                      : ''),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Contact newContact = await ContactsService.openContactForm();
          if (newContact != null) {
            setState(() {
              contacts.add(newContact);
              filteredContacts = contacts;
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
