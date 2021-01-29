import 'package:flutter/material.dart';
import 'package:happynomnom/log_entry.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeago/timeago.dart' as timeago;

class LogEntryList extends StatelessWidget {
  final List<LogEntry> entries;

  LogEntryList({@required this.entries});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text("Latest Entries", style: TextStyle(fontSize: 24.0)),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: entries.map((entry) => _LogEntryListItem(entry)).toList(),
              )
            )
          ]
        )
      )
    );
  }
}


class _LogEntryListItem extends StatelessWidget {
  final LogEntry entry;
  _LogEntryListItem(@required this.entry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              RatingBar.builder(
                initialRating: 0.0 + this.entry.rating,
                minRating: 1.0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              Text("${timeago.format(entry.createdAt, locale: 'en_short')}"),
            ],
          )
        )
      )
    );
  }
}
