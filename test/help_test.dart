import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lookout/collapsible_list.dart';
import 'package:lookout/help.dart';

void main() {
  testWidgets('Help page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Help())));

    final cardList = tester.widgetList(find.byType(CollapsibleCard)).toList();
    expect(cardList.length, 6);

    final intervalCard = find.text("What is an Interval LookOut?");
    expect(intervalCard, findsOneWidget);

    final timedCard = find.text("What is a Timed LookOut?");
    expect(timedCard, findsOneWidget);

    final missCard = find.text("What happens if I miss a check in?");
    expect(missCard, findsOneWidget);

    final checkinCard = find.text("How does checking in work?");
    expect(checkinCard, findsOneWidget);

    final silentCard = find.text("What is the silent alarm?");
    expect(silentCard, findsOneWidget);

    final geoFenceCard = find.text("What is a GeoFence?");
    expect(geoFenceCard, findsOneWidget);
  });
}
