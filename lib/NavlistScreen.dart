import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradly/settingScreen.dart';
import 'login_screen.dart';

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
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text("Privacy Center"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.access_time_filled),
              title: Text("Activity Log"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
