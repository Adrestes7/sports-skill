import 'package:flutter/cupertino.dart';

class Category{
  String id;
  String name;
  String icon;
  String image;

  Category(this.id, this.name, this.icon, this.image);

  static Category fromJson(dynamic data){
    return Category(data["id"], data["name"], data["icon"], data ["image"]);
  }

}