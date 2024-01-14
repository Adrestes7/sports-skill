import 'dart:convert';
import 'package:sports_app/entities/Event.dart';
import 'package:http/http.dart';

class EventService {
  final String baseUrl = 'https://sportsapp-back-dev.us-east-1.elasticbeanstalk.com';

  Future<List<Event>> getEvents() async {
    Response response = await get(Uri.http('sportsapp-back-dev.us-east-1.elasticbeanstalk.com', '/events'));
    if (response.statusCode == 200) {
      List <dynamic> jsonEvents = jsonDecode(response.body);


      List<Event> events = jsonEvents.map((event) => Event.fromJson(event)).toList();

      // Alternatively, if you have a class-level variable named 'events', you can use 'addAll' to append to it
       events.addAll(jsonEvents.map((event) => Event.fromJson(event)));

      return events;
    } else {
      throw Exception('Failed to load events');
    }
  }
}