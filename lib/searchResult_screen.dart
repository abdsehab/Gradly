import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  static const primaryOrange = Color(0xFFFF7B00);
  static const darkText = Color(0xFF2D2D2D);
  static const greyFill = Color(0xFFF4F5F7);

  // list of tabs
  int selectedFilterIndex = 0;
  final List<String> filters = ['Top', 'People', 'Posts', 'Groups', 'Events'];

  //  dummy search results list
  final List<Map<String, String>> searchResults = [
    {'name': 'Alex Johnson', 'type': 'Student • Computer Science'},
    {'name': 'Sarah Williams', 'type': 'Alumni • Graphic Design'},
    {'name': 'Introduction to Flutter Development', 'type': 'Post • 2 hours ago'},
    {'name': 'Mike Brown', 'type': 'Student • Business Admin'},
    {'name': 'Graduation 2026 Planning', 'type': 'Group • 120 members'},
    {'name': 'Emma Davis', 'type': 'Faculty • Engineering'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: darkText, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: _buildSearchBar(),
        actions: const [
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // filter chips
          _buildFilterChips(),
          const SizedBox(height: 16),

          // search status text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Showing results for "Flutter"',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // search results list
          Expanded(
            child: ListView.separated(
              itemCount: searchResults.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[200],
                height: 1,
                indent: 70,
              ),
              itemBuilder: (context, index) {
                final result = searchResults[index];

                // Logic to check people
                final isPerson = result['type']!.contains('Student') ||
                    result['type']!.contains('Alumni') ||
                    result['type']!.contains('Faculty');

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    radius: 24,
                    // grey background on people and light orange on posts background
                    backgroundColor: isPerson ? greyFill : primaryOrange.withValues(alpha: 0.1),
                    child: Icon(
                      isPerson ? Icons.person_outline : Icons.article_outlined,
                      color: isPerson ? Colors.grey[600] : primaryOrange,
                    ),
                  ),
                  title: Text(
                    result['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkText,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    result['type']!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  // Connect or arrow based on people or post
                  trailing: isPerson
                      ? OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryOrange,
                      side: const BorderSide(color: primaryOrange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      minimumSize: const Size(0, 32),
                    ),
                    child: const Text('Connect'),
                  )
                      : const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: greyFill,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Flutter...',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 15),
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
          suffixIcon: const Icon(Icons.cancel, color: Colors.grey, size: 16),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = selectedFilterIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(filters[index]),
              selected: isSelected,
              onSelected: (selected) {
                // clicking a chip updates the UI state
                setState(() {
                  selectedFilterIndex = index;
                });
              },
              selectedColor: primaryOrange,
              backgroundColor: greyFill,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : darkText,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? primaryOrange : Colors.transparent,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}