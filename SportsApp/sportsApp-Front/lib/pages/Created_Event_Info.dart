import 'package:flutter/material.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';

class CreatedEventInfo extends StatefulWidget {
  final String id;

  const CreatedEventInfo({Key? key, required this.id}) : super(key: key);

  @override
  State<CreatedEventInfo> createState() => CreatedEventInfoState();
}

class CreatedEventInfoState extends State<CreatedEventInfo> {
  late Future<Event> _event;

  @override
  void initState() {
    super.initState();
    _event = EventService.getEventById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
      ),
      body: FutureBuilder<Event>(
        future: _event,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Event not found"));
          } else {
            Event event = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${event.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Description: ${event.description}'),
                  SizedBox(height: 8),
                  Text('Location: ${event.location}'), // Actual location data
                  Text('Date: ${event.date}'), // Actual date data
                  Text('Start Time: ${event.startTime}'),
                  Text('End Time: ${event.endTime}'),// Actual time data
                  Text('Price: ${event.price}'),
                  ElevatedButton(
                    onPressed: () {
                      // Implement booking logic here
                      // You can navigate to a booking screen or perform booking actions.
                    },
                    child: Text('Book Event'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


