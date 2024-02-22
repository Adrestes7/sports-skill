import 'package:http/http.dart';
import 'package:sports_app/entities/Categorietypes.dart';
import 'dart:convert';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/utilities/FromJsonConverter.dart';
import 'package:image_picker/image_picker.dart';

import 'LocalStorage.dart';

class EventService {

  static Future<List<Event>> getEvents() async {
    List<Event> events = [];
    Response response = await get(Uri.http('10.0.2.2:5000', '/events'));
    if (response.statusCode == 200) {
      List<dynamic> jsonEvents = jsonDecode(response.body);
      jsonEvents.forEach(
          (event) => events.add(FromJsonConverter.newEventfromJson(event)));

      return events;
    } else {
      throw Exception('Failed to load events');
    }
  }

  static Future<List<Category>> getCategoryData() async{
    List<Category> categories =[];
    Response response = await get(Uri.http("10.0.2.2:5000", "/category"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonCategories = data["categories"];
    for (var category in jsonCategories) {
      categories.add(Category.fromJson(category));
    }
    return categories;
  }


  static Future<Event> getEventById(String id) async {
    Response response = await get(Uri.parse("http://10.0.2.2:5000/event/$id"));
    Map data = jsonDecode(response.body);
    return FromJsonConverter.newEventfromJson(data);
  }

  static Future<void> sendEvent(Event event, List<XFile> files) async {
    var request = MultipartRequest('POST', Uri.http("10.0.2.2:5000", "/event"));
    for (var i = 0; i < files.length; i++) {
      request.files.add(await MultipartFile.fromPath('file', files[0].path));
    }
    request.fields["eventInfo"] = jsonEncode(event);

    var response = await request.send();

    if (response.statusCode == 201) {
      print('Event sent successfully');
    } else {
      print('Failed to send event. Status code: ${response.statusCode}');
      throw Exception('Failed to send event');
    }
  }

  static Future<int> subscribeToEvent(String userId, String eventId) async {
    Response response = await post(Uri.http('10.0.2.2:5000', '/event/user'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'userId': userId, 'eventId': eventId}));
    return response.statusCode;
  }

}
