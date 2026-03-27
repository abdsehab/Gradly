import 'package:flutter/material.dart';

class ReactionsScreen extends StatefulWidget {
  const ReactionsScreen({super.key});

  @override
  State<ReactionsScreen> createState() => _ReactionsScreenState();
}

class _ReactionsScreenState extends State<ReactionsScreen> {
  static const darkText = Color(0xFF2D2D2D);

  // dummy data
  final List<String> dummyNames = [
    'naimul islam',
    'Jahir Alam',
    'Md Tanvir Islam',
    'Abdullah Al Sehab',
    'S M Samauzzaman',
    'Swapnomoy Biswas',
    'Daud Sharif',
    'Sadnan Samim',
    'Maruf Hasan Tawhid',
    'Md Akib',
    'Anwarul Huq',
    'Taskin Khan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)
        ),
        title: const Text(
          'Likes',
          style: TextStyle(
            fontWeight: FontWeight.bold
              ,
            fontSize: 21,
            color: darkText
          ),
        ),
      ),
      body: ListView.separated(
          itemCount: dummyNames.length,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          separatorBuilder: (context, index) => Divider(
            height: 3,
            color: Colors.grey[200],
            indent: 6
          ),
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.person, color: Colors.grey, size: 28),
              ),
              title: Text(
                dummyNames[index],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
            );
          }
          )
    );
  }
  
}