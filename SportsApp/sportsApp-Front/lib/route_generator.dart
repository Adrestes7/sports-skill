import 'package:flutter/material.dart';
import 'package:sports_app/appView/AppView.dart';
import 'package:sports_app/pages/Activity_Review_Events.dart';
import 'package:sports_app/pages/Create_Event_Add_Title.dart';
import 'package:sports_app/pages/Create_Event_Instructions.dart';
import 'package:sports_app/pages/Create_Event_Load_Photos.dart';
import 'package:sports_app/pages/Create_Event_Main_Info.dart';
import 'package:sports_app/pages/Create_Event_Select_Category.dart';
import 'package:sports_app/pages/Created_Event_Info.dart';
import 'package:sports_app/pages/Home.dart';
import 'package:sports_app/pages/Splash.dart';
import 'package:sports_app/pages/View_Profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => AppView());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/created_event_info':
        return MaterialPageRoute(builder: (_) => const CreatedEventInfo(id: "1"));
      case '/view_profile':
        return MaterialPageRoute(builder: (_) => const ViewProfilePage());
      case '/create_event_instructions':
        return MaterialPageRoute(builder: (_) => const CreateEvent());
      case '/create_event_select_category':
        return MaterialPageRoute(builder: (_) => const SelectEventCategory());
      case '/create_event_main_info':
        return MaterialPageRoute(builder: (_) => const EventInfo());
      case '/create_event_load_photos':
        return MaterialPageRoute(builder: (_) => const CreateEventLoadPhotos());
      case '/create_event_add_title':
        return MaterialPageRoute(builder: (_) => CreateEventAddTitle());
      case '/activity_review_events':
        return MaterialPageRoute(builder: (_) => ActivityReviewEvents());
      default:
        return MaterialPageRoute(builder: (_) => AppView());
    }
  }
}