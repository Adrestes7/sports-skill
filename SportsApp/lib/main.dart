import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sports_app/appView/AppView.dart';
import 'package:sports_app/pages/Home.dart';
import 'package:sports_app/pages/Profile.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => AppView(),
      '/home': (context) => Home(),
      '/profile': (context) => ProfilePage(),
    },
  ));

}

