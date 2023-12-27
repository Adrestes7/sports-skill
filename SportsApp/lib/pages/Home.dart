import 'package:flutter/material.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Event> events = [];

  @override
  void initState(){
    super.initState();
    EventService.getHomeData().then((value) => events = value).whenComplete(() => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){},
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
                        child: Text(events[index].numberOfPersons),
                      )
                    ],
                  )
                ],
              )
            ),
          );
        },
      );
  }
}

