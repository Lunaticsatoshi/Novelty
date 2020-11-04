import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  HomeScreen({Key key, @required this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 8, 24, 3),
      body: Container(
        child: Center(
          child: Text("Welcome to Home Screen" + widget.uid),
        ),
      ),
    );
  }
}