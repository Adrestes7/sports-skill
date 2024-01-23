import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_app/entities/Event.dart';

import 'package:uuid/uuid.dart';

class EventProvider with ChangeNotifier {
  Event _event = Event();
  late List<XFile> files;

  Event? get event => _event;

  void updateEventMainInfo(String date, String startTime, String endTime, String price, String location, String subcategory) {
    _event.date = date;
    _event.startTime = startTime;
    _event.endTime = endTime;
    _event.price = price;
    _event.location = location;
    //TODO add number of persons field
    _event.numberOfPersons = 4;
    _event.subCategory = subcategory;
    notifyListeners();
  }

  void addPhoto(List<XFile> files) {
    this.files = files;
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
    _event?.id = Uuid().v4();
    _event?.category = category;
  }
}
