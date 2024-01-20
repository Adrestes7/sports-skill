
//Flutter Material App
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:sports_app/pages/Create_Event_Add_Title.dart';

//  User Activity Flow (review and adjust current created adn booked events
import 'package:sports_app/pages/Activity_Review_Events.dart';

// Chat & Interact Flow

// Providers
import 'package:sports_app/widgets/Providers.dart';




void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        // Add other providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
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
        '/create_event_add_title' : (context) => CreateEventAddTitle (),
        // User Activity Flow (review and adjust current created and booked events)
        '/activity_review_events' : (context) => ActivityReviewEvents (),
        // Add other routes as needed
      },
    );
  }
}

