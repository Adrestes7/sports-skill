import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegistrationField(title: 'Email'),
            SizedBox(height: 20),
            RegistrationField(title: 'Phone Number'),
            SizedBox(height: 20),
            RegistrationField(title: 'Birthday'),
            SizedBox(height: 20),
            RegistrationField(title: 'Current Location'),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Logic to handle form submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationField extends StatelessWidget {
  final String title;

  const RegistrationField({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter $title',
            ),
          ),
        ),
      ],
    );
  }
}

