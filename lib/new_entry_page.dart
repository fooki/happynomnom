import 'package:flutter/material.dart';
import 'package:happynomnom/rate_food_dialog.dart';
import 'package:happynomnom/log_entry.dart';

class NewEntryPage extends StatefulWidget {
  final Function(LogEntry entry) onNewLogEntry;

  NewEntryPage({
      Key key,
      this.onNewLogEntry,
  }) : super(key: key);

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Entry'),
      ),
      body: Center(
        child: RateFoodDialog(
          onRatingSet: (rating) {
            widget.onNewLogEntry(LogEntry(rating, DateTime.now()));
            Navigator.pushNamed(context, '/',);
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/',);
        },
        tooltip: 'Cancel',
        child: Text('Cancel'),
      ),
    );
  }
}
