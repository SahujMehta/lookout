import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lookout/collapsible_list.dart';
import 'package:lookout/help.dart';

void main() {
  testWidgets('Number of Help Information Cards', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final cardList = tester.widgetList(find.byType(CollapsibleCard)).toList();
    expect(cardList.length, 6);
  });

  testWidgets('Interval Lookout Help', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final intervalCard = find.text("What is an Interval LookOut?");
    expect(intervalCard, findsOneWidget);
  });

  testWidgets('Timed Lookout Help', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final timedCard = find.text("What is a Timed LookOut?");
    expect(timedCard, findsOneWidget);
  });

  testWidgets('Missed Check In Help', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final missCard = find.text("What happens if I miss a check in?");
    expect(missCard, findsOneWidget);
  });

  testWidgets('Check In Help', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final checkinCard = find.text("How does checking in work?");
    expect(checkinCard, findsOneWidget);
  });

  testWidgets('Silent Alarm Help', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final silentCard = find.text("What is the silent alarm?");
    expect(silentCard, findsOneWidget);
  });

  testWidgets('GeoFence Help', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final geoFenceCard = find.text("What is a GeoFence?");
    expect(geoFenceCard, findsOneWidget);
  });
}
