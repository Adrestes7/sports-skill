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
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Event not found"));
          } else {
            Event event = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${event.title}',
                    style: const TextStyle(
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
                      showDialog(context: context,
                          builder: (context) =>AlertDialog(
                            title: Text("Estás seguro que deseas suscribirte a este evento?"),
                            actions: [
                              ElevatedButton(onPressed: (){
                                EventService.subscribeToEvent("721b4207-3045-4b14-9284-00b2efbd5c7f", widget.id).then((value) => {
                                  showDialog(context: context,
                                      builder: (context) => const AlertDialog(
                                        title: Text("Te has suscrito a este eveto con exito"),
                                      ))
                                }, onError: (e){
                                  showDialog(context: context,
                                      builder: (context) => const AlertDialog(
                                        title: Text("Hubo un problema"),
                                      ));
                                });
                              }, child: const Text("Si")),
                              ElevatedButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: const Text("No"))
                            ],
                          ));
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


