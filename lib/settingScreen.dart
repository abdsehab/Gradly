import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings & privacy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _buildSettingsTile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Language',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.privacy_tip,
            title: 'Privacy checkup',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.lock,
            title: 'Privacy Center',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.list_alt,
            title: 'Activity log',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool hasTrailing = false,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black87, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: hasTrailing
          ? const Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 16)
          : null,
    );
  }
}
