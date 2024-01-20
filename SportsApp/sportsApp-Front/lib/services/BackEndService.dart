import 'dart:convert';
import 'package:http/http.dart';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/entities/Categorietypes.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/utilities/FromJsonConverter.dart';
import 'package:sports_app/widgets/Providers.dart';



class EventService {

   //Retrieve data from back end

  final String baseUrl = 'https://sportsapp-back-dev.us-east-1.elasticbeanstalk.com';
  static Future<List<Event>> getEvents() async {
    List <Event> events = [];
    Response response = await get(Uri.http('sportsapp-back-dev.us-east-1.elasticbeanstalk.com', '/events'));
    if (response.statusCode == 200) {
      List <dynamic> jsonEvents = jsonDecode(response.body);
       jsonEvents.forEach((event) => events.add (FromJsonConverter.newEventfromJson(event)));

      return events;}
      else {
      throw Exception('Failed to load events');
    }
  }

  static Future<List<Category>> getCategoryData() async{
    List <Category> categories = [];
    Response response = await get(Uri.http('sportsapp-back-dev.us-east-1.elasticbeanstalk.com', '/category'));
    if (response.statusCode == 200) {
      List <dynamic> jsonEvents = jsonDecode(response.body);
      jsonEvents.forEach((category) => categories.add (Category.fromJson(category)));
      return categories;}
    else {
      throw Exception('Failed to load events');
    }
  }



  // Send data to Backend

  final String apiUrl = 'https://sportsapp-back-dev.us-east-1.elasticbeanstalk.com';

  static Future<void> sendEvent(Event? _event) async {
    final response = await post(
      (Uri.http('sportsapp-back-dev.us-east-1.elasticbeanstalk.com', '/events')),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(_event?.toJson()), // Assuming toJson is a method in your Event class
    );

    if (response.statusCode == 200) {
      print('Event sent successfully');
    } else {
      print('Failed to send event. Status code: ${response.statusCode}');
      throw Exception('Failed to send event');
    }
  }
}