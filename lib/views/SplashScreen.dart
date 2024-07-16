// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  bool checkNet = false;

  bool getStatusUser = true;

  @override
  void initState() {
    super.initState();

    // Timer(
    //     const Duration(seconds: 4),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildScreen());
  }

  Scaffold buildScreen() {
    return Scaffold(
      body: Container(
        child: const Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 170.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Recognize Text")],
            )
          ],
        ),
      ),
    );
  }
}
