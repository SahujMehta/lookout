import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lookout/contacts.dart';

void main() {
  testWidgets('Contacts page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ContactsList()));

    final title = find.text('Contacts');
    expect(title, findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    final ContactsListState contactsListState =
        tester.state(find.byType(ContactsList));
    expect(contactsListState.groups.length, 1);
  });
}
