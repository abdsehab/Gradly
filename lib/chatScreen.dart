import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Search Bar
          const _ChatSearchBar(),

          // 2. Chat List
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Dummy count for now
              itemBuilder: (context, index) {
                return _ChatTile(
                  name: 'User ${index + 1}',
                  message: 'This is the last message sent...',
                  time: '1${index}m',
                  isUnread: index % 3 == 0, // Mocking some unread states
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- Clean, modular components ---

class _ChatSearchBar extends StatelessWidget {
  const _ChatSearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: "Search Messenger",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isUnread;

  const _ChatTile({
    required this.name,
    required this.message,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("Opening chat with $name");
      },
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          // Online status indicator (optional, but looks human-written)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isUnread ? Colors.black : Colors.grey,
                fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          Text(" · $time", style: const TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: isUnread
          ? const Icon(Icons.circle, size: 12, color: Colors.blue)
          : null,
    );
  }
}
