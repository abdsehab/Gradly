import 'package:flutter/material.dart';
import 'package:gradly/login_screen.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFD6220);
    const lightOrange = Color(0xFFFF9E40);
    const darkText = Color(0xFF2D2D2D);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, size: 20)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Branding
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 28,
                  height: 28,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Gradly',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: darkText
                  ),
                )
              ],
            ),
            const SizedBox(height: 28),
            // Title
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // Welcome Text
            const Text(
              'Join Gradly and start your journey',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),
            ),
            const SizedBox(height: 40),
            // Name Input Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: const TextStyle(color: Color(0xFF808080)),
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: const Icon(Icons.person_outlined, color: primaryOrange),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: lightOrange, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: primaryOrange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Email Input Field
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Color(0xFF808080)),
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: const Icon(Icons.email_outlined, color: primaryOrange),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: lightOrange, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: primaryOrange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password Input Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Color(0xFF808080)),
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: const Icon(Icons.visibility_off_outlined, color: primaryOrange,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: lightOrange, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: primaryOrange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Sign Up Button
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage()
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryOrange
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Back to Login Screen
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                );
              },
              child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                    children: [
                      const TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              color: primaryOrange,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ],
                  )
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}