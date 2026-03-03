import 'package:flutter/material.dart';

const Color pc = Color(0xFF0A7CFF);
const Color bc = Colors.white;
const Color sc = Color(0xFFEEEEEE);

class ChatUser {
  final String name;
  final String profileImageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
  final bool hasUnreadMessage;

  const ChatUser({
    required this.name,
    required this.profileImageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    required this.hasUnreadMessage,
  });
}

class ChatMessage {
  final String text;
  final bool isSentByMe;
  final String time;

  const ChatMessage({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}

final List<ChatUser> sampleChatUsers = [
  const ChatUser(
    name: 'Abdullah Al Sehab',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Hey! Are you coming tomorrow?',
    lastMessageTime: '2m',
    isOnline: true,
    hasUnreadMessage: true,
  ),
  const ChatUser(
    name: 'Abdullah Al Sehab',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Sure, I will send it to you.',
    lastMessageTime: '15m',
    isOnline: true,
    hasUnreadMessage: false,
  ),
  const ChatUser(
    name: 'Karim Hassan',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Let\'s catch up this weekend!',
    lastMessageTime: '1h',
    isOnline: false,
    hasUnreadMessage: true,
  ),
  const ChatUser(
    name: 'Abdullah Al Sehab',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Thanks a lot!',
    lastMessageTime: '3h',
    isOnline: true,
    hasUnreadMessage: false,
  ),
  const ChatUser(
    name: 'Omar Faruk',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Did you check the new update?',
    lastMessageTime: '5h',
    isOnline: false,
    hasUnreadMessage: true,
  ),
  const ChatUser(
    name: 'Abdullah Al Sehab',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Okay, see you then!',
    lastMessageTime: '1d',
    isOnline: false,
    hasUnreadMessage: false,
  ),
  const ChatUser(
    name: 'Yusuf Islam',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'Haha that was so funny',
    lastMessageTime: '2d',
    isOnline: true,
    hasUnreadMessage: false,
  ),
  const ChatUser(
    name: 'Abdullah Al Sehab',
    profileImageUrl: 'Images/propic.jpeg',
    lastMessage: 'I just sent you the file.',
    lastMessageTime: '3d',
    isOnline: false,
    hasUnreadMessage: false,
  ),
];

// Demo messages
List<ChatMessage> getDemoMessages(String userName) {
  return [
    ChatMessage(text: 'Hey! How are you?', isSentByMe: false, time: '10:00 AM'),
    ChatMessage(
      text: 'I\'m doing great, thanks! You?',
      isSentByMe: true,
      time: '10:01 AM',
    ),
    ChatMessage(
      text: 'Pretty good! What are you up to?',
      isSentByMe: false,
      time: '10:02 AM',
    ),
    ChatMessage(
      text: 'Just working on a Flutter app',
      isSentByMe: true,
      time: '10:03 AM',
    ),
    ChatMessage(
      text: 'Oh nice! How is it going?',
      isSentByMe: false,
      time: '10:04 AM',
    ),
    ChatMessage(
      text: 'Really well! Learning a lot.',
      isSentByMe: true,
      time: '10:05 AM',
    ),
    ChatMessage(
      text: 'That\'s awesome, keep it up!',
      isSentByMe: false,
      time: '10:06 AM',
    ),
  ];
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bc,
      appBar: AppBar(
        backgroundColor: bc,
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
          // Search bar
          const _ChatSearchBar(),

          // chatlist
          Expanded(
            child: ListView.builder(
              itemCount: sampleChatUsers.length,
              itemBuilder: (context, index) {
                final user = sampleChatUsers[index];
                return _ChatTile(user: user);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatSearchBar extends StatelessWidget {
  const _ChatSearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: sc,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Search Messenger',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final ChatUser user;

  const _ChatTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigate to the chat detail
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatDetailScreen(user: user)),
        );
      },
      leading: _UserAvatar(
        imageUrl: user.profileImageUrl,
        isOnline: user.isOnline,
      ),
      title: Text(
        user.name,
        style: TextStyle(
          fontWeight: user.hasUnreadMessage
              ? FontWeight.bold
              : FontWeight.normal,
          fontSize: 15,
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              user.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: user.hasUnreadMessage ? Colors.black : Colors.grey,
                fontWeight: user.hasUnreadMessage
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
          ),
          Text(
            ' · ${user.lastMessageTime}',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      // blue dot
      trailing: user.hasUnreadMessage
          ? const Icon(Icons.circle, size: 12, color: pc)
          : null,
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  const _UserAvatar({required this.imageUrl, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    final ImageProvider profileImage = AssetImage(imageUrl);

    return Stack(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: profileImage,
          backgroundColor: sc,
        ),
        // Green dot when the user is online
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: bc, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final ChatUser user;

  const ChatDetailScreen({super.key, required this.user});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageInputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late List<ChatMessage> _messages;

  @override
  void initState() {
    super.initState();
    //demo conversation
    _messages = getDemoMessages(widget.user.name);
  }

  @override
  void dispose() {
    _messageInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // send button
  void _handleSendMessage() {
    final typedText = _messageInputController.text.trim();
    if (typedText.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          text: typedText,
          isSentByMe: true,
          time: TimeOfDay.now().format(context),
        ),
      );
    });

    _messageInputController.clear();

    // Scroll down message
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bc,
      appBar: AppBar(
        backgroundColor: bc,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            _UserAvatar(
              imageUrl: widget.user.profileImageUrl,
              isOnline: widget.user.isOnline,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.user.isOnline ? 'Active now' : 'Offline',
                  style: TextStyle(
                    fontSize: 12,
                    color: widget.user.isOnline ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: sc),

          // list of messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _MessageBubble(message: _messages[index]);
              },
            ),
          ),

          // Message input field
          _ChatInputBar(
            controller: _messageInputController,
            onSend: _handleSendMessage,
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// MESSAGE BUBBLE
// =============================================================================

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isMine = message.isSentByMe;

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(
          // Bubbles won't stretch beyond 70% of the screen width
          maxWidth: MediaQuery.of(context).size.width * 0.70,
        ),
        decoration: BoxDecoration(
          color: isMine ? pc : sc,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isMine ? 18 : 4),
            bottomRight: Radius.circular(isMine ? 4 : 18),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            fontSize: 15,
            color: isMine ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// CHAT INPUT BAR (bottom of ChatDetailScreen)
// =============================================================================

class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _ChatInputBar({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            // Text input field
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: sc,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: controller,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    hintText: 'Aa',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Send button
            GestureDetector(
              onTap: onSend,
              child: const CircleAvatar(
                radius: 22,
                backgroundColor: pc,
                child: Icon(Icons.send_rounded, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
