import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super
        .initState(); // For future initialization logics like time or animations Ej: Uber
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('Assets/Images/Logov1.png', width: 300, height: 300),
            const SizedBox(height: 40),
            const Text(
              'Tribu',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
