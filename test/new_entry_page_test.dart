// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:happynomnom/new_entry_page.dart';

void main() {
  testWidgets('New Entry Page', (WidgetTester tester) async {
      var entryRating;

      await tester.pumpWidget(
        MaterialApp(
          home: NewEntryPage(onNewLogEntry: (entry) {
            entryRating = entry.rating;
          })
        )
      );

      await tester.tap(find.byIcon(Icons.favorite).last);
      await tester.pump();

      await tester.tap(find.text('Continue'));
      await tester.pump();

      expect(entryRating, equals(5));
  });
}
