import 'package:flutter/material.dart';
//import 'package:gradly/postScreen.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gradly',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Sets the color scheme.
      ),
      home: HomePage(), // Sets the initial screen of the app.
    );
  }
}