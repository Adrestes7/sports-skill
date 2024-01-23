import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
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
    Response response = await get(Uri.http('10.0.2.2:5000', '/events'));
    if (response.statusCode == 200) {
      List <dynamic> jsonEvents = jsonDecode(response.body);
       jsonEvents.forEach((event) => events.add (FromJsonConverter.newEventfromJson(event)));

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
  static Future<List<Category>> getCategoryData() async{
    List <Category> categories = [];
    Response response = await get(Uri.http('10.0.2.2:5000', '/category'));
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

  static Future<void> sendEvent(Event event, List<XFile> files) async {

    var request = MultipartRequest('POST', Uri.http("10.0.2.2:5000", "/event"));
    for(var i = 0; i<files.length; i++){
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
}