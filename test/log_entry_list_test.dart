import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happynomnom/log_entry_list.dart';
import 'package:happynomnom/log_entry.dart';

void main() {
  testWidgets('LogEntryList works with empty entries', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LogEntryList(entries: []),
        )
      );
  });

  testWidgets('LogEntryList renders provided entries', (WidgetTester tester) async {
      final List<LogEntry> entries = [
        LogEntry(1, DateTime.now()),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: LogEntryList(entries: entries),
        )
      );

      expect(find.textContaining('now'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNWidgets(5));
  });
}
