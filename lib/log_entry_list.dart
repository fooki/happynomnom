import 'package:flutter/material.dart';
import 'package:happynomnom/log_entry.dart';

class LogEntryList extends StatelessWidget {
  final List<LogEntry> entries;

  LogEntryList({@required this.entries});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: entries.map((entry) => _LogEntryListItem(entry)).toList(),
    );
  }
}


class _LogEntryListItem extends StatelessWidget {
  final LogEntry entry;
  _LogEntryListItem(@required this.entry);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('${entry.createdAt}: ${entry.rating}')
    );
  }
}
