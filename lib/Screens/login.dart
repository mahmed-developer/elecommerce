import 'package:elecommerce/Screens/Homepage.dart';
import 'package:elecommerce/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:elecommerce/widgets/custom_text_field.dart';
import 'package:elecommerce/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final authController=ref.watch(authControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Login',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            CustomTextField(
              labelText: 'Email',
              controller: emailController,
            ),
            CustomTextField(
              labelText: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(color: Color(0xff96d1c7)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              text: 'LOGIN',
              onPressed: () async {
                try {
                  bool success = await authController.signIn(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );

                  if (success) {
                    // Navigate to the Homepage if sign-in is successful
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  } else {
                    // Show SnackBar if sign-in failed
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please check your credentials.')),
                    );
                  }
                } catch (e) {
                  // Show SnackBar with error message if an exception occurs
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sign-in Error: ${e.toString()}')),
                  );
                }
              },
            ),

            const SizedBox(height: 20.0),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Don’t have an account? Sign up',
                  style: TextStyle(color: Color(0xff96d1c7)),
                ),
              ),
            ),
            const Center(
              child: Text('Or login with social account'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/google.png'),
                  iconSize: 40.0,
                  onPressed: () {
                    // Implement Google login logic here
                  },
                ),
                const SizedBox(width: 20.0),
                IconButton(
                  icon: Image.asset('assets/facebook.png'),
                  iconSize: 40.0,
                  onPressed: () {
                    // Implement Facebook login logic here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}