import 'package:flutter/material.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Event>> _events;

  @override
  void initState() {
    super.initState();
    _events = EventService.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder <List<Event>>(
                future: _events,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('Event not found'));
                  } else {
                    List<Event> events = snapshot.data!;
                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                              onTap: () {},
                              title: Text(events[index].title),
                              subtitle: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(events[index].description),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(events[index].location),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(50.0),
                                        child: Text(events[index].price),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(50.0),
                                        child:
                                            Text(events[index].numberOfPersons),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        );
                      },
                    );
                  }
                }));
  }
}
