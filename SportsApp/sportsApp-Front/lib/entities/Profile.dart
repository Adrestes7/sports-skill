
import 'package:sports_app/entities/Sport.dart';

class Profile{
  String id;
  String name;
  String lastName;
  String age;
  String address;
  List<Sport> sports;
  String photoPath;
  String email;

  Profile(this.id, this.name, this.lastName, this.age, this.address,
      this.sports, this.photoPath, this.email);

  static Profile fromJson(dynamic data){
    List<Sport> sports = [];
    List<dynamic> jsonSports = data["sports"];
    for(var jsonSport in jsonSports){
      Sport sport = Sport(jsonSport["sportName"], jsonSport["userGrade"], jsonSport["feedbackGrade"], jsonSport["numberOfPersons"]);
      sports.add(sport);
    }
    return Profile(data["id"], data["name"], data["lastName"], data["age"], data["address"], sports, data["photoPath"], data["email"]);
  }
}