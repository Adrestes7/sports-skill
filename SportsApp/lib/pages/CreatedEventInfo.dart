import 'package:flutter/material.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';

class CreatedEventInfo extends StatefulWidget {
  final String eventId;

  const CreatedEventInfo({super.key, required this.eventId});

  @override
  _CreatedEventInfoState createState() => _CreatedEventInfoState ();
}

class _CreatedEventInfoState extends State<CreatedEventInfo> {
  late Future<Event> _event;
  final EventService _eventsService = EventService();

  @override
  void initState() {
    super.initState();
    int eventIdInt = int.parse(widget.eventId);
    _event = _eventsService.getEventById(eventIdInt);

  }

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),

      ),

      body: FutureBuilder<Event>(
        future: _event,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text ('Event not found'));
          } else {
            Event event = snapshot.data!;
            return Padding
              (padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${event.id}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Title: ${event.title}'),
                  SizedBox(height: 8),
                  Text('Description: ${event.description}'),
                  SizedBox(height: 8),
                  Text('Location: ${event.location}'),
                ],
              )
            );

          } //Clossing else final case

        } //Clossing whole if

      )


    );

}
}

