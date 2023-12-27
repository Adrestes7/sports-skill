import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sports_app/pages/Home.dart';

class Splash extends StatefulWidget {
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

    Timer(Duration(seconds: 2),(){

      Navigator.of(context).pushReplacementNamed('/');

    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('Assets/Images/Logov1.png', width: 150, height: 150),
            SizedBox(height: 20),
            Text(
              'Communities',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
