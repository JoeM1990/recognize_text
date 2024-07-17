// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_unnecessary_containers, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recognize_text/views/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildScreen());
  }

  Scaffold buildScreen() {
    return Scaffold(
      body: Container(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Recognize-Text",
                style: TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
