import 'package:flutter/material.dart';
import 'package:sports_app/entities/Event.dart';
import 'dart:convert';

class EventProvider with ChangeNotifier {
  Event _event = Event();

  Event? get event => _event;

  void updateEventMainInfo(String date, String startTime, String endTime, String price, String location) {
    _event.date = date;
    _event.startTime = startTime;
    _event.endTime = endTime;
    _event.price = price;
    _event.location = location;
    notifyListeners();
  }

  void addPhoto(String photoPath) {
    _event.photoUrls?.add(photoPath);
    notifyListeners();
  }

  void updatePhotoOrder(List<String> newPhotoOrder) {
    _event.photoUrls = newPhotoOrder;
    notifyListeners();
  }

  void updateTitleAndDescription(String title, String description) {
    _event.title = title;
    _event.description = description;
    notifyListeners();
  }

  void updateCategoryInfo(String category){
    _event?.category = category;
  }


}
