import 'package:flutter/material.dart';

class ReactionsScreen extends StatefulWidget {
  const ReactionsScreen({super.key});

  @override
  State<ReactionsScreen> createState() => _ReactionsScreenState();
}

class _ReactionsScreenState extends State<ReactionsScreen> {
  static const primaryOrange = Color(0xFFFF7B00);
  static const darkText = Color(0xFF2D2D2D);

  // dummy data
  final List<String> dummyNames = [
    'naimul islam',
    'Jahir Alam',
    'MD. Tanvir Islam',
    'Abdullah Al Sehab',
    'S M Samauzzaman',
    'Swapnomoy Biswas',
    'Daud Sharif',
    'Sadnan Samim',
    'Maruf Hasan Tawhid',
    'Md. Akib',
    'Anwarul Huq',
    'Taskin Khan',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: darkText),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Reactions',
            style: TextStyle(color: darkText, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            // Tabs
            Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                indicatorColor: primaryOrange,
                labelColor: primaryOrange,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 3,
                tabs: [
                  // all tabs
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('All 12', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  //  reaction tabs
                  _buildTabIcon(Icons.thumb_up_alt_outlined, 11), // like
                  _buildTabIcon(Icons.favorite_border, 11), // love
                  _buildTabIcon(Icons.emoji_emotions_outlined, 11), // wow
                  _buildTabIcon(Icons.sentiment_dissatisfied, 11), // sad
                  _buildTabIcon(Icons.mood_bad_outlined, 11), // angry
                ],
              ),
            ),

            // listed view of reactions given
            Expanded(
              child: TabBarView(
                children: [
                  _buildUserListView(Colors.blue, Icons.thumb_up), // all
                  _buildUserListView(Colors.blue, Icons.thumb_up), // like
                  _buildUserListView(Colors.red, Icons.favorite), // love
                  _buildUserListView(Colors.deepPurple, Icons.emoji_emotions), // wow
                  _buildUserListView(Colors.brown, Icons.sentiment_dissatisfied), // sad
                  _buildUserListView(Colors.orange[800]!, Icons.mood_bad), //angry
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Tab _buildTabIcon(IconData icon, int count) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            count.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildUserListView(Color badgeColor, IconData badgeIcon) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: dummyNames.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          // dummy profile picture icon
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.person, color: Colors.grey[400], size: 30),
              ),
              //  A color badge on top of circle avatar
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  // circle avatar on dummy pictures
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: badgeColor,
                    child: Icon(badgeIcon, size: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          // Names
          title: Text(
            dummyNames[index],
            style: const TextStyle(
              color: darkText,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}