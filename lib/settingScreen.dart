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
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Personal Details"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.password),
              title: Text("Password"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.video_camera_front_outlined),
              title: Text("Media Center"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.ads_click),
              title: Text("Ads Center"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Dark Mode"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
