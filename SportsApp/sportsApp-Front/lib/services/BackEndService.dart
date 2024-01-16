import 'dart:convert';
import 'package:sports_app/entities/Event.dart';
import 'package:http/http.dart';

class EventService {
  final String baseUrl = 'https://sportsapp-back-dev.us-east-1.elasticbeanstalk.com';

  static Future<List<Event>> getEvents() async {
    List <Event> events = [];
    Response response = await get(Uri.http('10.0.2.2:5000', '/events'));
    if (response.statusCode == 200) {
      List <dynamic> jsonEvents = jsonDecode(response.body);

      // Alternatively, if you have a class-level variable named 'events', you can use 'addAll' to append to it
       jsonEvents.forEach((event) => events.add (Event.fromJson(event)));

      return events;}
      else {
      throw Exception('Failed to load events');
    }
  }

  static Future<Response> userLogin(String email, String password) async {
    Response response = await post(Uri.http(
        '10.0.2.2:5000', '/login'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        })
    );
    return response;
  }
}