import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _postTextController = TextEditingController();
  bool _isPostButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _postTextController.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    _postTextController.removeListener(_handleTextChanged);
    _postTextController.dispose();
    super.dispose();
  }

  void _handleTextChanged() {
    setState(() {
      _isPostButtonEnabled = _postTextController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New post',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Post button on the top right
        actions: [
          _PostButton(
            isEnabled: _isPostButtonEnabled,
            onPressed: () {
              // post submission logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const _UserInfoHeader(),
          const Divider(height: 1, color: Colors.orange),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: TextField(
                controller: _postTextController,
                maxLines: null,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 18),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // media attachment option
          const _AttachmentBar(),
        ],
      ),
    );
  }
}

// Displays user's profile picture and name
class _UserInfoHeader extends StatelessWidget {
  const _UserInfoHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/propic.jpeg'),
          ),
          const SizedBox(width: 12),
          const Text(
            'Abdullah Al Sehab',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
//Post Button

class _PostButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const _PostButton({required this.isEnabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: TextButton(
          onPressed: isEnabled ? onPressed : null,
          style: TextButton.styleFrom(
            backgroundColor: isEnabled
                ? const Color(0xffEFEFEF)
                : Colors.black12,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Post',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isEnabled ? const Color(0xff1C1E21) : Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}

// media attachment option
class _AttachmentBar extends StatelessWidget {
  const _AttachmentBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // photo/video picker logic
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_library_outlined,
                        color: Color(0xff4CB35E),
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Photo/video',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff1C1E21),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
