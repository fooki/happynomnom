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
        LogEntry(1, DateTime.parse('2021-02-01')),
        LogEntry(3, DateTime.parse('2021-02-02')),
        LogEntry(5, DateTime.parse('2021-02-03')),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: LogEntryList(entries: entries),
        )
      );

      expect(find.textContaining('2021-02-01'), findsOneWidget);
      expect(find.textContaining('2021-02-02'), findsOneWidget);
      expect(find.textContaining('2021-02-03'), findsOneWidget);
  });
}
