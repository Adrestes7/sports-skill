
import 'package:flutter/cupertino.dart';

class Category{
  String id;
  String name;
  String icon;

  Category(this.id, this.name, this.icon);

  static Category fromJson(dynamic data){
    return Category(data["id"], data["name"], data["icon"]);
  }

}