import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _postController = TextEditingController();
  bool _hasContent = false;

  @override
  void initState() {
    super.initState();
    _postController.addListener(() {
      setState(() {
        _hasContent = _postController.text.trim().isNotEmpty;
      });
    });
  }

  void _submitPost() {
    if (!_hasContent) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Post submitted!")));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lightOrange = Color(0xFFFF9E40);
    const primaryOrange = Color(0xFFFD6220);
    const dividerColor = Color(0xFFE0E0E0);
    const hintColor = Color(0xFF888888);
    const darkText = Color(0xFF2D2D2D);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: lightOrange,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Create Post",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                backgroundColor: Colors.white24,
                radius: 18,
                child: Icon(Icons.close, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, color: Colors.white70, size: 26),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abdullah Al Sehab",
                      style: TextStyle(
                        color: darkText,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.public, color: darkText, size: 13),
                          SizedBox(width: 4),
                          Text(
                            "Public",
                            style: TextStyle(color: darkText, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Divider(color: dividerColor, height: 1),

          // Text field
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: TextField(
                controller: _postController,
                maxLines: null,
                style: TextStyle(color: darkText, fontSize: 17),
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(color: hintColor, fontSize: 17),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Add to post row
          Divider(color: dividerColor, height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Add to your post",
                  style: TextStyle(
                    color: darkText,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                Icon(Icons.photo, color: Colors.green, size: 30),
              ],
            ),
          ),

          // Post button
          Divider(color: dividerColor, height: 1),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 20),
            child: GestureDetector(
              onTap: _hasContent ? _submitPost : null,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _hasContent ? primaryOrange : Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: _hasContent ? Colors.white : hintColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
