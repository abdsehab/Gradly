import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFD6220);
const Color textDark = Color(0xFF11120D);
const Color textLight = Color(0xFF888888);

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text('Comments'), backgroundColor: Colors.white, foregroundColor: textDark, elevation: 0),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Comment composer
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primaryColor.withValues(alpha: 0.7), width: 1.5),
              boxShadow: [BoxShadow(color: primaryColor.withValues(alpha: 0.25), blurRadius: 16, spreadRadius: 1, offset: Offset(0, 6))],
            ),
            child: Column(children: [
              TextField(maxLines: 3, decoration: InputDecoration(hintText: 'Add comment', border: InputBorder.none)),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor, foregroundColor: Colors.white, shape: StadiumBorder()),
                  child: Text('Send'),
                ),
              ]),
            ]),
          ),
          SizedBox(height: 16),
          // Dummy comment
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(backgroundColor: primaryColor, child: Text('M', style: TextStyle(color: Colors.white))),
              SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Dummy Guy', style: TextStyle(fontWeight: FontWeight.w600, color: textDark)),
                SizedBox(height: 4),
                Text('Dummy Comment', style: TextStyle(color: textDark)),
                SizedBox(height: 6),
                Text('10m ago', style: TextStyle(color: textLight, fontSize: 12)),
              ])),
            ]),
          ),
        ],
      ),
    );
  }
}