import 'package:flutter/material.dart';

import 'settingScreen.dart';

class NavListScreen extends StatelessWidget {
  const NavListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const _UserProfileHeader(
              name: 'Abdullah Al Sehab',
              imagePath: 'Images/propic.jpeg',
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(color: Colors.black12, thickness: 1),
            ),

            //Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildNavTile(
                    icon: Icons.settings,
                    title: 'Settings & privacy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildNavTile(
                    icon: Icons.help,
                    title: 'Help & support',
                    onTap: () {},
                  ),
                  _buildNavTile(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        radius: 18,
        child: Icon(icon, color: Colors.black87, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black45),
    );
  }
}

class _UserProfileHeader extends StatelessWidget {
  final String name;
  final String imagePath;

  const _UserProfileHeader({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
