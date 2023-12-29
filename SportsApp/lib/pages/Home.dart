import 'package:flutter/material.dart';
import 'package:sports_app/pages/CreatedEventInfo.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';

class Home extends StatefulWidget {
  const Home({Key? key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Event> events = [];
  List<Event> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    EventService.getHomeData().then((value) {
      setState(() {
        events = value;
        filteredEvents = value;
      });
    });
  }

  void filterEvents(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredEvents = events
            .where((event) =>
        event.title.toLowerCase().contains(query.toLowerCase()) ||
            event.description.toLowerCase().contains(query.toLowerCase()) ||
            event.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredEvents = events;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            filterEvents(value);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredEvents.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CreatedEventInfo(eventId: filteredEvents[index].id),
                    ),
                  );
                },
                title: Text(filteredEvents[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(filteredEvents[index].description),
                    SizedBox(height: 4.0),
                    Text(filteredEvents[index].location),
                    SizedBox(height: 4.0),
                    Text(filteredEvents[index].price),
                    SizedBox(height: 4.0),
                    Text(filteredEvents[index].numberOfPersons),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


