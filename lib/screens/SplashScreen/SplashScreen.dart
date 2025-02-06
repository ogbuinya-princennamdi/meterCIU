import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meterciu/AuthenticationPage/LoginPage.dart';
import 'package:meterciu/SharedFiles/Logo.dart';
import 'package:meterciu/screens/homePage/HomePage.dart';

import '../../SharedFiles/LoadingLogo.dart';
import '../Usage.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  _navigateToDashboard() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 146, 154), // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingLogo(),
          ],
        ),
      ),
    );
  }
}
