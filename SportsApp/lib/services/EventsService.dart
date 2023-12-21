import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:sports_app/entities/Event.dart';

class EventService {
  static Future<List<Event>> getHomeData() async{
    List<Event> events = [];
    Response response = await get(Uri.parse('https://f1a7e888-0013-4908-b45a-cef41db93bed.mock.pstmn.io/events'));
    Map data = jsonDecode(response.body);
    List<dynamic> jsonEvents = data["events"];
    jsonEvents.forEach((element) {events.add(Event.fromJson(element));});
    return events;
  }
}