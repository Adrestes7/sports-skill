import 'package:flutter/material.dart';
import '../services/EventsService.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Add your save logic here if needed
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create an Event',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                // Add your save logic here
                Navigator.pop(context); // Return to home
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Creating an activity is simple!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildCard(
                    '1. Tell us about your activity',
                    'Share basic information like location, schedule, and category',
                  ),
                  _buildCard(
                    '2. Make it stand out!',
                    'Add some cool photos, detailed description',
                  ),
                  _buildCard(
                    '3. Finish up & Publish',
                    'Set an initial price, safety rules',
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/create_event_select_category');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Button background color
                          onPrimary: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Button border radius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle.isNotEmpty) SizedBox(height: 8),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


