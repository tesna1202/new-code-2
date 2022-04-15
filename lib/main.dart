import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/screens/homescreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homescreen(),
  );
}}
