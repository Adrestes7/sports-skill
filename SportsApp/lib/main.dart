
import 'package:flutter/material.dart';
import 'package:sports_app/appView/AppView.dart';
import 'package:sports_app/pages/CreateEvent.dart';
import 'package:sports_app/pages/EventInfo.dart';
import 'package:sports_app/pages/Home.dart';
import 'package:sports_app/pages/ViewProfile.dart';
import 'package:sports_app/pages/SelectCategory.dart';
import 'package:sports_app/pages/Splash.dart';
import 'package:sports_app/pages/CreatedEventInfo.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => AppView(),
      '/splash': (context) => Splash(),
      '/home': (context) => Home(),
      '/profile': (context) => ViewProfilePage(id: '1',),
      '/event': (context) => CreateEvent(),
      '/category': (context) => SelectCategory(),
      '/eventinfo': (context) => EventInfo(),
      '/createdeventinfo': (context) => CreatedEventInfo(id: '1',),

    },
  ));

}

