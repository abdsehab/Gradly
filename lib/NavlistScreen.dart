import 'package:flutter/material.dart';
import 'package:gradly/settingScreen.dart';

class Navlistscreen extends StatelessWidget {
  const Navlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFD6220);
    const lightOrange = Color(0xFFFF9E40);
    const darkText = Color(0xFF2D2D2D);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings and Privacy",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: lightOrange,
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingScreen()),
                );
              },
            ),
            ListTile(title: Text("Settings"), onTap: () {}),
            ListTile(title: Text("Privacy Center"), onTap: () {}),
            ListTile(title: Text("Activity Log"), onTap: () {}),
            ListTile(title: Text("Logout"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
