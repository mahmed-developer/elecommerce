import 'package:elecommerce/Screens/Homepage.dart';
import 'package:elecommerce/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:elecommerce/widgets/custom_text_field.dart';
import 'package:elecommerce/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class SignUpScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const SizedBox(height: 40.0), // Optional: Add some space at the top
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            CustomTextField(
              labelText: 'Name',
              controller: nameController,
            ),
            CustomTextField(
              labelText: 'Email',
              controller: emailController,
            ),
            CustomTextField(
              labelText: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 20.0),
            Center(
              child:
              GestureDetector(child: const Text(
                'Already have an account?',
                style: TextStyle(color: Color(0xff96d1c7)),
              ),
                onTap: (){
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ),
            CustomButton(
              text: 'SIGN UP',
              onPressed: () async {
                bool success = await authController.signUp(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                    nameController.text.trim()
                );
                try{if (success) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Homepage()));
                } }catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email Already Exists')));
                }
              }

    ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text('Or sign up with social account'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/google.png'),
                  iconSize: 40.0,
                  onPressed: () {
                    // Implement Google sign-up logic here
                  },
                ),
                const SizedBox(width: 20.0),
                IconButton(
                  icon: Image.asset('assets/facebook.png'),
                  iconSize: 40.0,
                  onPressed: () {
                    // Implement Facebook sign-up logic here
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