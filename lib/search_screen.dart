import 'package:flutter/material.dart';
import 'package:gradly/searchResult_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Search Anything...', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: -0.5)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          // Search input
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5), spreadRadius: 2, blurRadius: 10, offset: Offset(0, 3))],
            ),
            child: TextField(
              autofocus: true,
              onSubmitted: (_) => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchResultScreen())),
              decoration: InputDecoration(
                fillColor: Colors.white, filled: true,
                hintText: 'Type to search...', hintStyle: TextStyle(color: Colors.black38),
                suffixIcon: Icon(Icons.tune, color: Colors.black54),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey.shade300)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFFFD6220), width: 1.5)),
              ),
            ),
          ),
          SizedBox(height: 8),
          // Suggestions box
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 15, offset: Offset(0, 4))],
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                _item('University'),
                _item('Graduates'),
                _item('Alumni'),
                _item('Books'),
                _item('Computers'),
                _item('Electronics'),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _item(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(title, style: TextStyle(fontSize: 15, color: Colors.black87)),
      ),
    );
  }
}