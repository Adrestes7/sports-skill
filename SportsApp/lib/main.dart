
import 'package:flutter/material.dart';
import 'package:sports_app/appView/AppView.dart';
import 'package:sports_app/pages/CreateEvent.dart';
import 'package:sports_app/pages/EventInfo.dart';
import 'package:sports_app/pages/Home.dart';
import 'package:sports_app/pages/ViewProfile.dart';
import 'package:sports_app/pages/SelectCategory.dart';
import 'package:sports_app/pages/Splash.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      '/': (context) => AppView(),
      '/splash': (context) => Splash(),
      '/home': (context) => Home(),
      '/profile': (context) => ProfilePage(id: '1',),
      '/event': (context) => CreateEvent(),
      '/category': (context) => SelectCategory(),
      '/eventInfo': (context) => EventInfo()
    },
  ));

}

