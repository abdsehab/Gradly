import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFFFB76B).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFF4DF),

              ),
            ),
          )
        ],
      )
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Gradly',
        style: TextStyle(
          color: Color(0xFFFF8D21),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 8.0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Color(0xFFFFB76B),
      backgroundColor: Color(0xFFFFF4DF),

      centerTitle: true,
      leading: GestureDetector(
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/profile5.svg',
            height: 28,
            width: 28,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFFF4DF),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              width: 40,
              child: SvgPicture.asset(
                'assets/icons/nav2.svg',
                height: 40,
                width: 40,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFF4DF),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ),
      ],
    );
  }
}
