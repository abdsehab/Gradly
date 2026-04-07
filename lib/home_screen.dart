import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradly/NavlistScreen.dart';
import 'package:gradly/comments_screen.dart';
import 'package:gradly/connect_screen.dart';
import 'package:gradly/postScreen.dart';
import 'package:gradly/profile_screen.dart';
import 'package:gradly/reactions_screen.dart';
import 'package:gradly/search_screen.dart';

import 'alert_screen.dart';
import 'chatScreen.dart';

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

  final _screens = const [
    _HomeFeed(),
    ConnectScreen(showAppBar: false),
    SizedBox.shrink(),
    AlertsScreen(),
    ChatListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        surfaceTintColor: Colors.transparent,
        leadingWidth: 100,
        leading: const Center(
          child: Text(
            'Gradly',
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
        ),
        title: OutlinedButton.icon(
          // SIMPLIFIED: Replaced Container & Row with native OutlinedButton
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SearchScreen()),
          ),
          icon: const Icon(Icons.search, color: Colors.black54, size: 20),
          label: const Text(
            'Search...',
            style: TextStyle(color: Colors.black45, fontSize: 14),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black12),
            alignment: Alignment.centerLeft,
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(40),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Navlistscreen()),
            ),
            icon: SvgPicture.asset(
              'assets/icons/nav2.svg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) {
            if (i == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatePostScreen()),
              );
              return;
            }
            setState(() => _selectedIndex = i);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: textLight,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              activeIcon: Icon(Icons.people),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              activeIcon: Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeFeed extends StatefulWidget {
  const _HomeFeed();
  @override
  State<_HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<_HomeFeed> {
  final ScrollController _scroll = ScrollController();
  bool _loading = false;

  final List<Map<String, dynamic>> _posts = [
    {
      'name': 'Maruf Hasan Tawhid',
      'initial': 'M',
      'time': '5 hours ago',
      'caption': 'Dummy Post 1',
      'images': [
        'https://picsum.photos/id/1018/600/400',
        'https://picsum.photos/id/1015/600/400',
      ],
    },
    {
      'name': 'Abdullah Al Sehab',
      'initial': 'A',
      'time': '2 hours ago',
      'caption': 'Dummy Post 2',
      'images': ['https://picsum.photos/id/1019/600/400'],
    },
    {
      'name': 'Sadnan Samim',
      'initial': 'S',
      'time': 'Just now',
      'caption': 'Dummy Post 3',
      'images': [],
    },
  ];

  @override
  void initState() {
    super.initState();
    _scroll.addListener(
      () => {
        if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200 &&
            !_loading)
          _loadMore(),
      },
    );
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _loadMore() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _posts.addAll([
        {
          'name': 'Maruf',
          'initial': 'M',
          'time': 'Just now',
          'caption': 'New Post loaded!',
          'images': ['https://picsum.photos/id/1020/600/400'],
        },
        {
          'name': 'Abdullah',
          'initial': 'A',
          'time': '1 min ago',
          'caption': 'Another post!',
          'images': [],
        },
      ]);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scroll,
      itemCount: _posts.length + 1 + (_loading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == 0)
          return Column(
            children: [
              Container(height: 1, color: primaryColor.withValues(alpha: 0.2)),
              ListTile(
                leading: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Text(
                      'T',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                title: OutlinedButton(
                  // SIMPLIFIED: Native button instead of manual container
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CreatePostScreen()),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.black12),
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Text(
                    'Share your thoughts...',
                    style: TextStyle(color: textLight, fontSize: 14),
                  ),
                ),
                trailing: const Icon(
                  Icons.photo_library_rounded,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ],
          );

        if (index == _posts.length + 1)
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(color: primaryColor),
            ),
          );

        final p = _posts[index - 1];
        return PostCard(
          userName: p['name'],
          userInitial: p['initial'],
          timeAgo: p['time'],
          caption: p['caption'],
          images: List<String>.from(p['images']),
        );
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final String userName, userInitial, timeAgo, caption;
  final List<String> images;

  const PostCard({
    super.key,
    required this.userName,
    required this.userInitial,
    required this.timeAgo,
    required this.caption,
    this.images = const [],
  });

  @override
  Widget build(BuildContext context) {
    // SIMPLIFIED: Local function completely replaces the massive _ActionButton class
    Widget actionBtn(
      IconData icon,
      String label, [
      String? count,
      VoidCallback? onTap,
    ]) => InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 18, color: textDark),
          const SizedBox(width: 4),
          Text(
            count != null ? '$count $label' : label,
            style: const TextStyle(
              fontSize: 12,
              color: textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

    return Card(
      // SIMPLIFIED: Used native Card instead of Container + BoxDecoration + BoxShadow
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      elevation: 1,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: CircleAvatar(
              backgroundColor: primaryColor,
              child: Text(
                userInitial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: textDark,
              ),
            ),
            subtitle: Text(
              timeAgo,
              style: const TextStyle(fontSize: 12, color: textLight),
            ),
            trailing: const Icon(Icons.more_horiz, color: textLight),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              caption,
              style: const TextStyle(
                fontSize: 15,
                color: textDark,
                height: 1.5,
              ),
            ),
          ),

          if (images.isNotEmpty)
            SizedBox(
              height: 220,
              child: images.length == 1
                  ? Image.network(
                      images[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Row(
                      children: images
                          .map(
                            (img) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Image.network(
                                  img,
                                  fit: BoxFit.cover,
                                  height: 220,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                Divider(color: Colors.grey.shade200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    actionBtn(
                      Icons.favorite_border,
                      'Likes',
                      '120k',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ReactionsScreen(),
                        ),
                      ),
                    ),
                    actionBtn(
                      Icons.chat_bubble_outline,
                      'Comment',
                      '25',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CommentsScreen(),
                        ),
                      ),
                    ),
                    actionBtn(Icons.share_outlined, 'Share', '231', () {}),
                    actionBtn(Icons.bookmark_border, 'Saved', '12'),
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            leading: CircleAvatar(
              backgroundColor: primaryColor,
              radius: 16,
              child: Text(
                userInitial,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            title: OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CommentsScreen()),
              ),
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: BorderSide(color: Colors.grey.shade300),
                alignment: Alignment.centerLeft,
              ),
              child: Text(
                'Write your comment...',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
