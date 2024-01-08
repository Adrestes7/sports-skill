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
    return Scaffold(
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
                  '1. Tell us more about your activity',
                  'Share basic information like location, schedule, and category',
                ),
                _buildCard(
                  '2. Confirm the information and voilà, your event is created!',
                  '',
                ),
                _buildCard(
                  '3. Add any additional details to make your event stand out',
                  'Customize with images, descriptions, and more!',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pushNamed(context, '/category');
        },
      ),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
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
    );
  }
}
