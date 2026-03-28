import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  static const primaryOrange = Color(0xFFFD6220);
  static const lightOrange = Color(0xFFFF9E40);
  static const darkText = Color(0xFF2D2D2D);
  static const greyFill = Color(0xFFF4F5F7);

  // dummy search results list
  final List<Map<String, String>> searchResults = [
    {'name': 'Alex Johnson', 'role': 'Student • Electrical Engineering'},
    {'name': 'Sarah Williams', 'role': 'Alumni • Graphic Design'},
    {'name': 'Teddy Smith', 'role': 'Student • Computer Science'},
    {'name': 'Mike Brown', 'role': 'Student • Business Admin'},
    {'name': 'Emma Davis', 'role': 'Faculty • Engineering'},
    {'name': 'Jon Snow', 'role': 'Alumni • Marketing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: darkText, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          // Search Status Text
          Text(
            'Showing results for "Flutter"',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          // Search Results List
          Expanded(
            child: ListView.separated(
              itemCount: searchResults.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[200], height: 1, indent: 70),
              itemBuilder: (context, index) {
                final result = searchResults[index];

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 16,
                  ),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: primaryOrange.withValues(alpha: 0.1),
                    child: Icon(Icons.person, color: primaryOrange),
                  ),
                  title: Text(
                    result['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkText,
                    ),
                  ),
                  subtitle: Text(
                    result['role']!,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      // logic for the connect button
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryOrange,
                      side: const BorderSide(color: primaryOrange),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text('Connect'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
