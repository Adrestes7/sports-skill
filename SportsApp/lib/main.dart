
//Flutter Material App
import 'package:flutter/material.dart';
// Onboarding Flow
import 'package:sports_app/pages/Splash.dart';
// Main App screens
import 'package:sports_app/pages/Home.dart';
import 'package:sports_app/appView/AppView.dart';
// Search and Book Events Flow
import 'package:sports_app/pages/Created_Event_Info.dart';
// Profile Flow
import 'package:sports_app/pages/View_Profile.dart';
// Create Event Flow
import 'package:sports_app/pages/Create_Event_Instructions.dart';
import 'package:sports_app/pages/Create_Event_Select_Category.dart';
import 'package:sports_app/pages/Create_Event_Main_Info.dart';
import 'package:sports_app/pages/Create_Event_Load_Photos.dart';
import 'package:sports_app/pages/Create_Event_Photos_Display.dart';

// Review Booked and Created Events Flow
// Chat & Interact Flow




void main() {
  runApp(MaterialApp(
    initialRoute: '/create_event_load_photos',
    routes: {
      // Onboarding Flow
      '/splash': (context) => Splash(),
      // Main App screens
      '/': (context) => AppView(),
      '/home': (context) => Home(),
      // Search and Book Events Flow
      '/created_event_info': (context) => CreatedEventInfo(id: '1',),
      // Profile Flow
      '/view_profile': (context) => ViewProfilePage(id: '1',),
      // Create Event Flow
      '/create_event_instructions': (context) => CreateEvent(),
      '/create_event_select_category': (context) => SelectEventCategory(),
      '/create_event_main_info': (context) => EventInfo(),
      '/create_event_load_photos' : (context) => CreateEventLoadPhotos(),
      '/create_event_photos_display' : (context) => CreateEventPhotosDisplay (),
      // Review Booked and Created Events Flow
      // Chat & Interact Flow
    },
  ));

}

