import 'package:flutter/material.dart';
import 'package:gradly/chatScreen.dart';
import 'package:gradly/login_screen.dart';
import 'package:gradly/postScreen.dart';
import 'package:gradly/reactions_screen.dart';
import 'package:gradly/splash_screen.dart';

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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginScreen(),
    );
  }
}
