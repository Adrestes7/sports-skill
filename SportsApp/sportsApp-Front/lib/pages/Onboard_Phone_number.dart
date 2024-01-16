import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const RegistrationField(title: 'Email'),
            const SizedBox(height: 20),
            const RegistrationField(title: 'Phone Number'),
            const SizedBox(height: 20),
            const RegistrationField(title: 'Birthday'),
            const SizedBox(height: 20),
            const RegistrationField(title: 'Current Location'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Logic to handle form submission
              },
              child: const Text('Submit'),
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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