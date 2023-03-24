import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lookout/contacts.dart';

void main() {
  testWidgets('Contacts title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactsList()));

    final title = find.text('Contacts');
    expect(title, findsOneWidget);
  });

  testWidgets('Add Group', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactsList()));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    final ContactsListState contactsListState =
        tester.state(find.byType(ContactsList));
    expect(contactsListState.groups.length, 1);
  });
}
