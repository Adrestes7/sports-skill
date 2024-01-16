
//Flutter Material App
import 'package:flutter/material.dart';
// Onboarding Flow
import 'package:sports_app/pages/Splash.dart';
import 'package:sports_app/pages/Onboard_Welcome.dart';
import 'package:sports_app/pages/Onboard_Sign_In_Tap.dart';
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
import 'package:sports_app/services/LocalStorage.dart';

// Chat & Interact Flow




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(MaterialApp(
    initialRoute: '/onboardwelcome',
    routes: {
      // Onboarding Flow
      '/splash': (context) => const Splash(),
      // Main App screens
      '/': (context) => const AppView(),
      '/home': (context) => const Home(),
      // Search and Book Events Flow
      '/created_event_info': (context) => const CreatedEventInfo(id: '1',),
      // Profile Flow
      '/view_profile': (context) => const ViewProfilePage(),
      // Create Event Flow
      '/create_event_instructions': (context) => const CreateEvent(),
      '/create_event_select_category': (context) => const SelectEventCategory(),
      '/create_event_main_info': (context) => const EventInfo(),
      '/create_event_load_photos' : (context) => const CreateEventLoadPhotos(),
      '/create_event_photos_display' : (context) => const CreateEventPhotosDisplay (),
      '/create_event_add_title' : (context) => CreateEventAddTitle (),
      //  User Activity Flow (review and adjust current created adn booked events
      '/activity_review_events' : (context) => ActivityReviewEvents (),

      '/onboardwelcome': (context) => OnboardWelcome(),
      '/onboardsignintap': (context) => const Onboard_Sign_In_Tap(),
      // Review Booked and Created Events Flow
      // Chat & Interact Flow
    },
  ));

}

