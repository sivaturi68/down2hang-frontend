import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Event {
  final String title;
  final String description;

  Event({required this.title, required this.description});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      description: json['description'],
    );
  }
}

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late List<Event> events;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    events = await getEvents();
    setState(() {
      isLoading = false;
    });
  }

  Future<List<Event>> getEvents() async {
    final contents = await rootBundle.loadString('assets/events.json');
    final List<dynamic> list = json.decode(contents);
    return list.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(events[index].title),
                    subtitle: Text(events[index].description),
                  ),
                );
              },
            ),
    );
  }
}
