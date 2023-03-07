import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lookout/my_home_page.dart';

void main() {
  testWidgets('Home Navbar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text('Home'));
    final MyHomePageState myHomePageStateHome =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateHome.selectedIndex, 0);
  });

  testWidgets('Contacts Navbar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text('Contacts'));
    final MyHomePageState myHomePageStateContacts =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateContacts.selectedIndex, 1);
  });

  testWidgets('Help Navbar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text('Help'));
    final MyHomePageState myHomePageStateHelp =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateHelp.selectedIndex, 2);
  });

  testWidgets('Settings Navbar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text('Settings'));
    final MyHomePageState myHomePageStateSettings =
        tester.state(find.byType(MyHomePage));
    expect(myHomePageStateSettings.selectedIndex, 3);
  });

  testWidgets('Timed Lookout Button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text("Start Timed LookOut"));
    await tester.tap(find.text("Start Timed LookOut"));
    await tester.pump();
    final HomeState homeState = tester.state(find.byType(Home));
    expect(homeState.items.length, 2);
  });

  testWidgets('Interval Lookout Button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    await tester.tap(find.text("Start Interval LookOut"));
  });

  testWidgets('Title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    final title = find.text('LookOut');
    expect(title, findsOneWidget);
  });

  testWidgets('Initial List State', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    final HomeState homeState = tester.state(find.byType(Home));
    expect(homeState.items.length, 0);
  });
}
