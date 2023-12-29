import 'package:flutter/material.dart';

class Profile{
  String id;
  String name;
  String lastName;
  String age;
  String address;
  List<String> sports;
  Feedback feedback;
  int initialGrade;
  String photoPath;

  Profile(this.id, this.name, this.lastName, this.age, this.address,
      this.sports, this.feedback, this.initialGrade, this.photoPath);

  static Profile fromJson(dynamic data, Feedback feedback){
    return Profile(data["id"], data["name"], data["lastName"], data["age"], data["address"], data["sports"], feedback, data["initialGrade"], data["photoPath"]);
  }
}