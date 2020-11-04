import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 8, 24, 3),
      body: Center(
        child: Text(
          "Splash Screen"
        ),
      ),
    );
  }
}