import 'dart:convert';
import 'package:sports_app/entities/Event.dart';
import 'package:http/http.dart';

class EventService {
  final String baseUrl = 'https://sportsapp-back-dev.us-east-1.elasticbeanstalk.com';

  static Future<List<Event>> getEvents() async {
    List <Event> events = [];
    Response response = await get(Uri.http('sportsapp-back-dev.us-east-1.elasticbeanstalk.com', '/events'));
    if (response.statusCode == 200) {
      List <dynamic> jsonEvents = jsonDecode(response.body);

      // Alternatively, if you have a class-level variable named 'events', you can use 'addAll' to append to it
       jsonEvents.forEach((event) => events.add (Event.fromJson(event)));

      return events;}
      else {
      throw Exception('Failed to load events');
    }
  }
}