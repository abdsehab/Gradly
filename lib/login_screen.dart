import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to Home Screen after login
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Error message on login failure
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'An error occurred during login.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFD6220);
    const lightOrange = Color(0xFFFF9E40);
    const darkText = Color(0xFF2D2D2D);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Branding
                Image.asset(
                  'assets/images/logo.png',
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 14),
                const Text(
                  'Gradly',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Welcome text
            const Text(
              'Sign In to continue',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),
            const SizedBox(height: 40),
            // Email Input Field
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Color(0xFF808080)),
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: const Icon(Icons.email, color: primaryOrange),
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
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Color(0xFF808080)),
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: const Icon(Icons.visibility_off, color: primaryOrange,),
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
            // Sign In Button
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryOrange
                  ),
                  child: const Text(
                  'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15
                    ),
                  ),
              ),
            ),
            const SizedBox(height: 24),
            // Forgot Password
            TextButton(
                onPressed:() {

                },
                child: const Text(
                'Forgot Password?',
                  style: TextStyle(
                    color: primaryOrange,
                    fontWeight: FontWeight.w500
                  ),
                )
            ),
            const SizedBox(height: 40),
            // Move to Registration Screen
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationScreen())
                );
              },
              child: RichText(
                  text: TextSpan(
                    text: "Don't have any account? ",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                    children: [
                      const TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  )
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
