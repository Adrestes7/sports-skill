
//Flutter Material App
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:sports_app/route_generator.dart';
import 'package:sports_app/services/LocalStorage.dart';

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
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}

