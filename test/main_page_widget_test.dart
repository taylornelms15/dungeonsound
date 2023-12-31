// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:dungeonsound/main.dart';

Future<void> _test_main_page_action_bar(WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(const MyApp());

  expect(find.widgetWithText(AppBar, "Dungeon Sound"), findsOneWidget);

  // Test new button
  await tester.tap(find.byIcon(Icons.create));
  await tester.pump();

  // Test save button
  await tester.tap(find.byIcon(Icons.save));
  await tester.pump();

  // Test save-as button
  await tester.tap(find.byIcon(Icons.save_as));
  await tester.pump();

  // Test open button
  await tester.tap(find.byIcon(Icons.file_open));
  await tester.pump();

  // Test settings button
  await tester.tap(find.byIcon(Icons.settings));
  await tester.pump();
  await tester.pumpAndSettle(const Duration(milliseconds: 500));

  // Test info button
  FutureBuilder<PackageInfo> pifuture =
      find.byType(FutureBuilder<PackageInfo>).evaluate().single.widget as FutureBuilder<PackageInfo>;
  await tester.tap(find.byIcon(Icons.info));
  await tester.pumpAndSettle();
  //TODO: figure out how to test this bullshit
  //expect(find.byType(AboutDialog), findsOneWidget);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("MainPageWidgets", () {
    testWidgets("Action bar callbacks on main page", _test_main_page_action_bar);
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
