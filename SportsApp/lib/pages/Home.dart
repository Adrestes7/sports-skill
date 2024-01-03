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
  late Future<List<Event>> _events;
  late List<Event> filteredEvents = []; // Initialize as empty

  @override
  void initState() {
    super.initState();
    _events = EventService.getHomeData().then((value) {
      setState(() {
        events = value;
        filteredEvents = events; // Set filteredEvents initially to all events
      });
      return value;
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
        filteredEvents = events; // Reset to all events if query is empty
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        filterEvents(value);
                      },
                      decoration: InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 4.0,
                left: 32.0,
                child: Text(
                  'What do you want to do?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
              Positioned(
                top: 26.0,
                left: 32.0,
                child: Text(
                  'Any date . Anywhere . Add friends',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your filter action here
            },
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: FutureBuilder<List<Event>>(
        future: _events,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Profile not found'));
          } else {
            return ListView.builder(
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
                            builder: (context) => CreatedEventInfo(
                              id: filteredEvents[index].id,
                            ),
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
            );
          }
        },
      ),
    );
  }
}







