import 'package:flutter/material.dart';
import 'package:gradly/demo_msg.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const lightOrange = Color(0xFFFF9E40);
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            for (int i = 0; i < 10; i++) ...[
              ListTile(
                leading: Image.network(
                  "https://media.licdn.com/dms/image/v2/D4E03AQF7ecvGD6bDcA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1698188237751?e=2147483647&v=beta&t=UeXe57O1UHtHzACx4kUnGUE0bJyATFhFt1Ih-bpPXag",
                ),
                title: Text("SEHAB"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => demoMsg()),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}
