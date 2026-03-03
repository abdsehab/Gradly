import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradly/postScreen.dart';
import 'package:gradly/search_screen.dart';
import 'package:gradly/comments_screen.dart';
import 'package:gradly/connect_screen.dart';

const Color primaryColor = Color(0xFFFD6220);
const Color textDark = Color(0xFF11120D);
const Color textLight = Color(0xFF888888);

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        leadingWidth: 100,
        leading: Center(
          child: Text('Gradly', style: TextStyle(color: primaryColor, fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.5)),
        ),
        title: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
          child: Container(
            height: 40,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black12)),
            child: Row(children: [
              SizedBox(width: 12),
              Icon(Icons.search, color: Colors.black54, size: 20),
              SizedBox(width: 8),
              Text('Search...', style: TextStyle(color: Colors.black45, fontSize: 14)),
            ]),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/nav2.svg', height: 40, width: 40),
          ),
        ],
      ),
        body: _selectedIndex == 1 ? ConnectScreen(showAppBar: false) : ListView(
        padding: EdgeInsets.only(bottom: 100),
        children: [
          Container(height: 1, color: primaryColor.withValues(alpha: 0.2)),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: Row(children: [
              CircleAvatar(backgroundColor: primaryColor, radius: 22, child: Text('T', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CreatePostScreen())),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25), border: Border.all(color: Colors.black12)),
                    child: Text('Share your thoughts...', style: TextStyle(color: textLight, fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.photo_library_rounded, color: Color(0xFF000000), size: 26),
              ),
            ]),
          ),
          PostCard(userName: 'Maruf Hasan Tawhid', userInitial: 'M', timeAgo: '5 hours ago', caption: 'Dummy Post 1', images: ['https://picsum.photos/id/1018/600/400', 'https://picsum.photos/id/1015/600/400']),
          PostCard(userName: 'Abdullah Al Sehab', userInitial: 'A', timeAgo: '2 hours ago', caption: 'Dummy Post 2 ️', images: ['https://picsum.photos/id/1019/600/400']),
          PostCard(userName: 'Sadnan Samim', userInitial: 'S', timeAgo: 'Just now', caption: 'Dummy Post 3'),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 20, offset: Offset(0, 8))],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              selectedFontSize: 12,
              unselectedFontSize: 12,
              elevation: 0,
              currentIndex: _selectedIndex,
              onTap: (index) {
                if (index == 2) { Navigator.push(context, MaterialPageRoute(builder: (_) => CreatePostScreen())); return; }
                setState(() => _selectedIndex = index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: textDark,
              unselectedItemColor: textLight,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Column(mainAxisSize: MainAxisSize.min, children: [Container(margin: EdgeInsets.only(bottom: 3), height: 3, width: 35, decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2))), Icon(Icons.home)]), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.people_outline), activeIcon: Column(mainAxisSize: MainAxisSize.min, children: [Container(margin: EdgeInsets.only(bottom: 3), height: 3, width: 40, decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2))), Icon(Icons.people)]), label: 'Connect'),
                BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), activeIcon: Column(mainAxisSize: MainAxisSize.min, children: [Container(margin: EdgeInsets.only(bottom: 3), height: 3, width: 40, decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2))), Icon(Icons.add_box)]), label: 'Post'),
                BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), activeIcon: Column(mainAxisSize: MainAxisSize.min, children: [Container(margin: EdgeInsets.only(bottom: 3), height: 3, width: 40, decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2))), Icon(Icons.notifications)]), label: 'Alerts'),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), activeIcon: Column(mainAxisSize: MainAxisSize.min, children: [Container(margin: EdgeInsets.only(bottom: 3), height: 3, width: 35, decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2))), Icon(Icons.chat_bubble)]), label: 'Chat'),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String userName;
  final String userInitial;
  final String timeAgo;
  final String caption;
  final List<String> images;

  const PostCard({super.key, required this.userName, required this.userInitial, required this.timeAgo, required this.caption, this.images = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(children: [
              CircleAvatar(backgroundColor: primaryColor, radius: 20, child: Text(userInitial, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(userName, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: textDark)),
                Text(timeAgo, style: TextStyle(fontSize: 12, color: textLight)),
              ])),
              Icon(Icons.more_horiz, color: textLight),
            ]),
          ),

          // Caption
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(caption, style: TextStyle(fontSize: 15, color: textDark, height: 1.5)),
          ),

          // Images — no padding, stretches full width
          if (images.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0)),
              child: SizedBox(
                height: 220,
                child: images.length == 1
                    ? Image.network(images[0], fit: BoxFit.cover, width: double.infinity)
                    : Row(children: [
                  Expanded(child: Image.network(images[0], fit: BoxFit.cover, height: 220)),
                  SizedBox(width: 2),
                  Expanded(child: Image.network(images[1], fit: BoxFit.cover, height: 220)),
                ]),
              ),
            ),

          // Action buttons
          Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Column(children: [
              Divider(color: Colors.grey.shade200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ActionButton(icon: Icons.favorite_border, label: 'Likes', count: '120k'),
                  _ActionButton(icon: Icons.chat_bubble_outline, label: 'Comment', count: '25', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CommentsScreen()))),
                  _ActionButton(icon: Icons.share_outlined, label: 'Share', count: '231'),
                  _ActionButton(icon: Icons.bookmark_border, label: 'Saved', count: '12'),
                ],
              ),
            ]),
          ),

          // Comment input
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(children: [
              CircleAvatar(backgroundColor: primaryColor, radius: 16, child: Text(userInitial, style: TextStyle(color: Colors.white, fontSize: 12))),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CommentsScreen())),
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: Colors.grey.shade300)),
                    child: Align(alignment: Alignment.centerLeft, child: Text('Write your comment...', style: TextStyle(color: Colors.grey.shade500, fontSize: 14))),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? count;
  final VoidCallback? onTap;

  const _ActionButton({required this.icon, required this.label, this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Row(children: [
        Icon(icon, size: 18, color: textDark),
        SizedBox(width: 4),
        Text(count != null ? '$count $label' : label, style: TextStyle(fontSize: 12, color: textDark, fontWeight: FontWeight.w500)),
      ]),
    );
  }
}