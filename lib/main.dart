import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en', ''), // English, no country code
      Locale('es', ''), // Spanish, no country code
    ],

    home: Homescreen(),
  );
}}
