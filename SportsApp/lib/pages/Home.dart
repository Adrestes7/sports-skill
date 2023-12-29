import 'package:flutter/material.dart';
import 'package:sports_app/pages/CreatedEventInfo.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Event> events = [];
  List<Event> filteredEvents = [];

  @override
  void initState(){
    super.initState();
    EventService.getHomeData().then((value) {
      setState(() {
        events = value;
        filteredEvents = value; //Adjusted to create search tab check with Sancho if is ok

      });
    });
  }

  //Function for filter by search check with Sancho if it is ok
  void filterEvents (String query){

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
        title: TextField (
          onChanged: (value) {
            filterEvents (value);
          },

          decoration: InputDecoration(
            hintText: 'Busque Mor...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            contentPadding: EdgeInsets.all (8.0),
          ),
        ),
      ),

    body:  ListView.builder(
      itemCount: filteredEvents.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatedEventInfo(eventId: filteredEvents[index].id),
                  ),
                );
              },
              title: Text(filteredEvents[index].title),
              subtitle: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(filteredEvents[index].description),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(filteredEvents[index].location),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(50.0),
                        child: Text(filteredEvents[index].price),
                      ),
                      Container(
                        padding: EdgeInsets.all(50.0),
                        child: Text(filteredEvents[index].numberOfPersons),
                      )
                    ],
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }
}

