
import 'package:http/http.dart';
import 'package:sports_app/entities/Category.dart';
import 'dart:convert';

import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/entities/Profile.dart';

class EventService {
  static Future<List<Event>> getHomeData() async {
    List<Event> events = [];
    Response response = await get(Uri.parse("https://7cadcbfc-005c-4480-89e1-93f478e35874.mock.pstmn.io/events"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonEvents = data["events"];
    jsonEvents.forEach((element) {
      events.add(Event.fromJson(element));
    });
    return events;
  }

  static Future<List<Category>> getCategoryData() async{
    List<Category> categories =[];
    Response response = await get(Uri.parse("https://7cadcbfc-005c-4480-89e1-93f478e35874.mock.pstmn.io/category"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonCategories = data["categories"];
    for (var category in jsonCategories)
    {categories.add(Category.fromJson(category)); }
    return categories;
  }

  static Future<Profile> getProfileData(String id) async{
    Response response = await get(Uri.parse("https://7cadcbfc-005c-4480-89e1-93f478e35874.mock.pstmn.io/profile/$id"));
    Map data = jsonDecode(response.body);
    return Profile.fromJson(data);
  }

  Future<Event> getEventById(int eventId) async {
    Response response = await get(Uri.parse(
        "https://989eaf5a-1bd9-48eb-8402-e9db47c3a2ee.mock.pstmn.io/events"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      Event event = Event.fromJson(data);
      return event;
    } else {
      throw Exception('Failed to load event');
    }
  }
}
