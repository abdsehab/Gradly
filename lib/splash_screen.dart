import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dart:async';

Color myColor = Color(0xFFFF7B00);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child,);
          },
          transitionDuration: Duration(milliseconds: 300),
        ),
      );
    });
  }

  Widget _buildEffect(double progress) {
    double size = 178.0 + (progress * 70.0);

    // Container of animation box
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      body: Center(
        child: AnimatedBuilder(animation: _controller, builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                _buildEffect(_animation.value),

                // logo container
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF7B00),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                    child: Image.asset('assets/images/logo.png', ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
