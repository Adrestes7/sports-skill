
import 'package:http/http.dart';
import 'package:sports_app/entities/Categorietypes.dart';
import 'dart:convert';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/entities/Profile.dart';

class EventService {

  static Future<List<Event>> getHomeData() async {
    List<Event> events = [];
    try{
      Response response = await get(Uri.http('sportsapp-back-dev.us-east-1.elasticbeanstalk.com', '/events'));
      List<dynamic> jsonEvents = jsonDecode(response.body);
      jsonEvents.map((e) => {
        events.add(Event.fromJson(e))
      });
      jsonEvents.forEach((element) {
        events.add(Event.fromJson(element));
      });
      return events;
    } on Exception catch(e){
      print(e);
      return events;
    }
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

  static Future<Event> getEventById(String id) async{
  Response response = await get(Uri.parse("https://06bf3054-c005-401c-956b-c3c6d658775e.mock.pstmn.io/events/$id"));
  Map data = jsonDecode(response.body);
  return Event.fromJson(data);
  }
  }

