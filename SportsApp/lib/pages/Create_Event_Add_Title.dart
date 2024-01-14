import 'package:flutter/material.dart';


class CreateEventAddTitle extends StatefulWidget {
  @override
  State<CreateEventAddTitle> createState() => _CreateEventAddTitleState();
}

class _CreateEventAddTitleState extends State<CreateEventAddTitle> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: CreateEventForm(
        titleController: _titleController,
        descriptionController: _descriptionController,
      ),

      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () {

              Navigator.pushNamed(context, '/');

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            child: Text(
              'Finish',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CreateEventForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  CreateEventForm({
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Which is your event title',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter event title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Which is your event description',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: descriptionController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter event description',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}