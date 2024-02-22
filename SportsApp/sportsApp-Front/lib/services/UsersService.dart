import 'dart:convert';
import 'package:http/http.dart';

import '../entities/Profile.dart';



class UserService {


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

  static Future<Profile> getProfileData(String id) async{
    Response response = await get(Uri.parse("http://10.0.2.2:5000/profile/$id"),headers: <String, String>{
      //'token': LocalStorage.prefs.getString("token")!
    });
    Map data = jsonDecode(response.body);
    return Profile.fromJson(data);
  }
}