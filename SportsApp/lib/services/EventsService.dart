
import 'package:http/http.dart';
import 'package:sports_app/entities/Category.dart';
import 'dart:convert';

import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/entities/Profile.dart';
import 'package:sports_app/entities/Feedback.dart';
import 'package:sports_app/entities/Sport.dart';

class EventService {

  static Future<List<Event>> getHomeData() async{
    List<Event> events = [];
    Response response = await get(Uri.parse("https://5e6df997-57ce-466b-9f5b-7c9aa9c42dd6.mock.pstmn.io/events"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonEvents = data["events"];
    jsonEvents.forEach((element) {events.add(Event.fromJson(element));});
    return events;
  }

  static Future<List<Category>> getCategoryData() async{
    List<Category> categories =[];
    Response response = await get(Uri.parse("https://5e6df997-57ce-466b-9f5b-7c9aa9c42dd6.mock.pstmn.io/category"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonCategories = data["categories"];
    for (var category in jsonCategories)
    {categories.add(Category.fromJson(category)); }
    return categories;
  }

  static Future<Profile> getProfileData(String id) async{
    Response response = await get(Uri.parse("https://5e6df997-57ce-466b-9f5b-7c9aa9c42dd6.mock.pstmn.io/profile/$id"));
    Map data = jsonDecode(response.body);
    return Profile.fromJson(data);
  }
}