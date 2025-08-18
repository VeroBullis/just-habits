import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:just_habits/main.dart';

// TODO: add keys to widgets

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('create new habit', (
        tester,
        ) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Finds the floating action button to tap on.
      var finder = find.byIcon(Icons.add);

      // Emulate a tap on the floating action button.
      await tester.tap(finder);

      // Trigger a frame.
      await tester.pumpAndSettle();

      expect(find.text('Create New'), findsOneWidget);

      finder = find.text("OK");
      await tester.tap(finder);
      await tester.pumpAndSettle();

      finder = find.byKey(Key("TitleTextField"));
      await tester.enterText(finder, "My Habit");
      await tester.pumpAndSettle();
      //
      // finder = find.text("Note");
      // await tester.enterText(finder, "My Note");
      // await tester.pumpAndSettle();

      // finder = find.text("Highlight");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("Repeat By");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("Week");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("S");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      // finder = find.text("M");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      // finder = find.text("T");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("Reminder");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("7:00 AM");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("6");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("OK");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("Advanced");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // // TODO: begin/end date testing
      //
      // finder = find.text("Tracking");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("Counter");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("Target");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.text("At Most");
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // // TODO: button
      //
      // finder = find.byIcon(Icons.arrow_back);
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // finder = find.byIcon(Icons.check);
      // await tester.tap(finder);
      // await tester.pumpAndSettle();
      //
      // expect(find.text('My Habit'), findsOneWidget);
    });
  });
}