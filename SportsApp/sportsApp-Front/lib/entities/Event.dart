import 'package:uuid/uuid.dart';

class Event {

  String? id;
  String? category;
  String? subCategory;
  String? date;
  String? startTime;
  String? endTime;
  String? price;
  int? numberOfPersons;
  String? location;
  String? country;
  String? city;
  String? title;
  String? description;
  List<String>? photoUrls;

  void addEventData(String id,String category,String subCategory,String date,String startTime,String endTime,String price,int numberOfPersons,String location,String country,String city,String title,String description,List<String> photoUrls){
    this.id = id;
    this.category = category;
    this.subCategory = subCategory;
    this.date = date;
    this.startTime = startTime;
    this.endTime = endTime;
    this.price = price;
    this.numberOfPersons = numberOfPersons;
    this.location = location;
    this.country = country;
    this.city = city;
    this.title = title;
    this.description = description;
    this.photoUrls = photoUrls;
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id ?? "",
      'category': category ?? "",
      'subCategory': subCategory ?? "",
      'date': date ?? "",
      'startTime': startTime ?? "",
      'endTime': endTime ?? "",
      'price': price ?? "",
      'numberOfPersons': numberOfPersons ?? "",
      'address': location ?? "",
      'country': country ?? "",
      'city': city ?? "",
      'title': title ?? "",
      'description': description ?? "",
      'photoUrls': photoUrls ?? [],
    };
  }


}