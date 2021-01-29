import 'package:flutter/material.dart';
import 'package:happynomnom/new_entry_page.dart';
import 'package:happynomnom/rate_food_dialog.dart';
import 'package:happynomnom/log_entry_list.dart';
import 'package:happynomnom/log_entry.dart';

void main() {
  runApp(HappyNomNom());
}

class HappyNomNom extends StatefulWidget {
  List<LogEntry> entries;

  HappyNomNom({Key key}) : super(key: key) {

    // this.entries = [
    //   LogEntry(1, DateTime.now()),
    //   LogEntry(1, DateTime.now()),
    //   LogEntry(1, DateTime.now()),
    //   ];
    this.entries = [];
  }

  @override
  _HappyNomNomState createState() => _HappyNomNomState();
}

class _HappyNomNomState extends State<HappyNomNom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Nom Nom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(
          entries: widget.entries,
          title: 'Happy Nom Nom',
        ),
        '/new': (context) => NewEntryPage(
          onNewLogEntry: (entry) {
            widget.entries.add(entry);
          }
        ),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<LogEntry> entries;

  MyHomePage({Key key, this.title, this.entries}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LogEntryList(entries: widget.entries),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/new',
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
