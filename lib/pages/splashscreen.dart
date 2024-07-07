import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noteapp/pages/components/togglebutton_self.dart';
import 'package:noteapp/pages/homepage.dart';
import 'package:noteapp/pages/notepage.dart';
import 'package:noteapp/pages/components/chatgptcode.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (Context) => Homepage()
      )
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Image.asset('assets/images/splashIcon.png'),
        ),
      ),
    );
  }
}
