import "package:flutter/material.dart";
import "package:meterciu/SharedFiles/Logo.dart";
import "package:meterciu/screens/SplashScreen/SplashScreen.dart";

import "AuthenticationPage/LoginPage.dart";


void main(){
  runApp(const MeterCiu());
}

class MeterCiu extends StatelessWidget {
  const MeterCiu({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: {
        // "loginPage": (context)=>const Loginpage(),
      },
    );
  }
}
