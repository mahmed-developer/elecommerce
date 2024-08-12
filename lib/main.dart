import 'package:elecommerce/Screens/signup.dart';
import 'package:elecommerce/Screens/splash_screen.dart';
import 'package:elecommerce/controller/auth_controller.dart';
import 'package:elecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elecommerce/Screens/Homepage.dart';
import 'package:elecommerce/Screens/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(ProviderScope(child: MyApp()));
}

final ThemeData theme = ThemeData(
  primaryColor: Color(0xffc3e703), // Lime Green
  scaffoldBackgroundColor: Color(0xff2c2c2c), // Dark Gray (for example)
  appBarTheme:const  AppBarTheme(
    color: Color(0xffc3e703), // Lime Green for AppBar
  ),
  // Define additional theme properties as needed
);


class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authState = ref.watch(authControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: authState == null ? LoginScreen() : const Homepage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(), 
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/homepage': (context) => const Homepage(),
      },
    );
  }
}
