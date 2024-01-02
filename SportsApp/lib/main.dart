
import 'package:flutter/material.dart';
import 'package:sports_app/appView/AppView.dart';
import 'package:sports_app/pages/CreateEvent.dart';
import 'package:sports_app/pages/EventInfo.dart';
import 'package:sports_app/pages/Home.dart';
import 'package:sports_app/pages/Profile.dart';
import 'package:sports_app/pages/SelectCategory.dart';
import 'package:sports_app/pages/Splash.dart';
import 'package:sports_app/pages/CreatedEventInfo.dart';
import 'package:sports_app/pages/Onboard_Welcome.dart';
import 'package:sports_app/pages/Onboard_Sign_In_Tap.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => AppView(),
      '/splash': (context) => Splash(),
      '/onboardwelcome': (context) => OnboardWelcome(),
      '/onboardsignintap': (context) => Onboard_Sign_In_Tap(),
      '/home': (context) => Home(),
      '/profile': (context) => ProfilePage(),
      '/event': (context) => CreateEvent(),
      '/category': (context) => SelectCategory(),
      '/eventinfo': (context) => EventInfo(),
      '/createdeventinfo': (context) => CreatedEventInfo(eventId: '',),

    },
  ));

}

