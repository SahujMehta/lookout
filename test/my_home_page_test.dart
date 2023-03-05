import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lookout/main.dart';
import 'package:lookout/my_home_page.dart';

void main() {
  testWidgets('Bottom Navbar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text('Home'));
    final MyHomePageState myHomePageStateHome =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateHome.selectedIndex, 0);

    await tester.tap(find.text('Contacts'));
    final MyHomePageState myHomePageStateContacts =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateContacts.selectedIndex, 1);

    await tester.tap(find.text('Help'));
    final MyHomePageState myHomePageStateHelp =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateHelp.selectedIndex, 2);

    await tester.tap(find.text('Settings'));
    final MyHomePageState myHomePageStateSettings =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateSettings.selectedIndex, 3);
  });
}
