import 'package:flutter/material.dart';
import 'package:pet_ui/HomeScreen.dart';
import 'package:pet_ui/DrawerScreen.dart';
import 'package:pet_ui/configuration.dart';

void main() {
  runApp(MaterialApp(
    title: "Pet Ui",
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen()
        ],
      ),
    );
  }
}
