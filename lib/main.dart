
import 'package:elecommerce/Screens/Homepage.dart';
import 'package:elecommerce/Screens/login.dart';
import 'package:elecommerce/Screens/signup.dart';
import 'package:elecommerce/Screens/signup.dart';
import 'package:elecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup',
      routes: {
        '/login': (ctx) => LoginScreen(),
        '/signup': (ctx) => SignUpScreen(),
      },
    );
  }
}

