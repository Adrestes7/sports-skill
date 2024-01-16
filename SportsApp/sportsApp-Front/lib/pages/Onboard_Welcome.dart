import 'dart:async';
import 'package:flutter/material.dart';
import 'Onboard_Sign_In_Tap.dart';


class OnboardWelcome extends StatefulWidget {
  const OnboardWelcome({super.key});

  @override
  _OnboardWelcomeState createState() => _OnboardWelcomeState();
}

class _OnboardWelcomeState extends State<OnboardWelcome> {
  final List<String> welcomeMessages = [
    "Welcome to Communities!",
    "Create adventures Make friends",
    "Siga Mor"
  ];

  int _currentPageIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPageIndex < welcomeMessages.length - 1) {
        setState(() {
          _currentPageIndex++;
        });
      } else {
        setState(() {
          _currentPageIndex = 0;
        });
      }
    });
  }

  void _handlePhoneNumberSignUp() {
    // Functionality when the Phone Number sign-up button is pressed
    print('Phone Number sign-up pressed!');
    // Add your code here for phone number sign-up logic
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.05),
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                'assets/your_image.png', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.2),
              child: Center(
                child: SizedBox(
                  height: screenHeight * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        welcomeMessages[_currentPageIndex],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Join Communities and make the most of your social life.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      FractionallySizedBox(
                        widthFactor: 0.75,
                        child: ElevatedButton(
                          onPressed: _handlePhoneNumberSignUp,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(color: Colors.grey),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'Sign up with Phone Number',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 9),
                      FractionallySizedBox(
                        widthFactor: 0.75,
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle Google sign-up
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(color: Colors.grey),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'Sign up with Google',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 9),
                      FractionallySizedBox(
                        widthFactor: 0.75,
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle Apple sign-up
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(color: Colors.grey),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'Sign up with Apple',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already on Communities? ',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Onboard_Sign_In_Tap(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
