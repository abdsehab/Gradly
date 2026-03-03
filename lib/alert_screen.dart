import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  static const Color primaryOrange = Color(0xFFFD6220);
  static const Color textDark = Color(0xFF11120D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Alerts', style: TextStyle(color: textDark, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            title: 'New Connection Request',
            subtitle: 'Maruf Hasan wants to connect with you.',
            time: '2m ago',
            icon: Icons.person_add_alt_1,
            isUnread: true,
          ),
          _buildNotificationItem(
            title: 'Post Trending',
            subtitle: 'Your dummy post 1 is getting a lot of traction! 🔥',
            time: '1h ago',
            icon: Icons.trending_up,
            isUnread: true,
          ),
          _buildNotificationItem(
            title: 'Security Alert',
            subtitle: 'New login detected from a Chrome browser on Windows.',
            time: 'Yesterday',
            icon: Icons.security,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      color: isUnread ? primaryOrange.withValues(alpha: 0.05) : Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: isUnread ? primaryOrange : Colors.grey.shade200,
          child: Icon(icon, color: isUnread ? Colors.white : Colors.grey, size: 20),
        ),
        title: Text(title, style: TextStyle(fontWeight: isUnread ? FontWeight.bold : FontWeight.w600, fontSize: 15, color: textDark)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
            const SizedBox(height: 4),
            Text(time, style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
          ],
        ),
        trailing: isUnread ? const CircleAvatar(radius: 4, backgroundColor: primaryOrange) : null,
      ),
    );
  }
}