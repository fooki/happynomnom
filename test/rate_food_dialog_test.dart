// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:happynomnom/rate_food_dialog.dart';

void main() {
  testWidgets('Rate food dialog ', (WidgetTester tester) async {
      var onRatingSetCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: RateFoodDialog(onRatingSet: (rating) {
              onRatingSetCalled = true;
          })
        )
      );

      expect(find.text('Continue'), findsNothing);

      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pump();

      await tester.tap(find.text('Continue'));
      await tester.pump();

      expect(onRatingSetCalled, equals(true));
  });
}
