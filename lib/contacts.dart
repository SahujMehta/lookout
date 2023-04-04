import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'add_contacts_page.dart';

class Group {
  final String name;
  final List<Contact> contacts;

  Group({required this.name, required this.contacts});
}

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List<Group> groups = [];
  List<Contact> allContacts = [];
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
    Iterable<Contact> contactsIterable =
        await ContactsService.getContacts() as Iterable<Contact>;
    setState(() {
      allContacts = contactsIterable.toList();
      filteredContacts = allContacts;
    });
  }

  void createGroup() async {
    final groupNameController = TextEditingController();
    final groupName = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create New Group'),
          content: TextFormField(
            autofocus: true,
            controller: groupNameController,
            decoration: InputDecoration(
              hintText: 'Group Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a group name';
              }
              return null;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Create'),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop(groupNameController.text);
                }
              },
            ),
          ],
        );
      },
    );
    setState(() {
      if (groupName != null) {
        groups.add(Group(name: groupName, contacts: []));
      }
    });
  }

  void addContactToGroup(Contact contact, Group group) {
    setState(() {
      group.contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groups[index].name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: groups[index].contacts.length,
                  itemBuilder: (context, contactIndex) {
                    return Text(
                        groups[index].contacts[contactIndex].displayName ?? '');
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (groups.isEmpty) {
            createGroup();
          }
          filteredContacts = allContacts;
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactsPage(
                contacts: allContacts,
                onContactsSelected: (newContacts) {
                  Group group = groups[0];
                  newContacts.forEach((contact) {
                    addContactToGroup(contact, group);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  final List<Contact> contacts;
  final ValueChanged<List<Contact>> onContactsSelected;

  ContactsPage({required this.contacts, required this.onContactsSelected});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> selectedContacts = [];

  void selectContact(Contact contact) {
    setState(() {
      if (selectedContacts.contains(contact)) {
        selectedContacts.remove(contact);
      } else {
        selectedContacts.add(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          TextButton(
            onPressed: () {
              widget.onContactsSelected(selectedContacts);
              Navigator.pop(context);
            },
            child: Text(
              'Done',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          Contact contact = widget.contacts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(contact.initials()),
            ),
            title: Text(contact.displayName ?? ''),
            subtitle: Text(contact.phones?.isNotEmpty == true
                ? contact.phones!.first.value ?? ''
                : ''),
            trailing: Checkbox(
              value: selectedContacts.contains(contact),
              onChanged: (value) {
                selectContact(contact);
              },
            ),
            onTap: () {
              selectContact(contact);
            },
          );
        },
      ),
    );
  }
}
