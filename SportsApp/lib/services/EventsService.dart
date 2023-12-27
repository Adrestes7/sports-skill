import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sports_app/entities/Category.dart';
import 'dart:convert';

import 'package:sports_app/entities/Event.dart';

class EventService {

  static Future<List<Event>> getHomeData() async{
    List<Event> events = [];
    Response response = await get(Uri.parse("https://989eaf5a-1bd9-48eb-8402-e9db47c3a2ee.mock.pstmn.io/events"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonEvents = data["events"];
    jsonEvents.forEach((element) {events.add(Event.fromJson(element));});
    return events;
  }

  static Future<List<Category>> getCategoryData() async{
    List<Category> categories =[];
    Response response = await get(Uri.parse("https://989eaf5a-1bd9-48eb-8402-e9db47c3a2ee.mock.pstmn.io/category"));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonCategories = data["categories"];
    jsonCategories.forEach((category) {categories.add(Category.fromJson(category)); });
    return categories;
}
}