import 'package:flutter/material.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFD6220);
    const lightOrange = Color(0xFFFF9E40);
    const darkText = Color(0xFF2D2D2D);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: lightOrange,
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(title: Text("Personal Details"), onTap: () {}),
            ListTile(title: Text("Password"), onTap: () {}),
            ListTile(title: Text("Media Center"), onTap: () {}),
            ListTile(title: Text("Ads Center"), onTap: () {}),
            ListTile(title: Text("Dark Mode"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
