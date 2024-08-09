import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
      (ref) => AuthController(FirebaseAuth.instance, FirebaseFirestore.instance),
);

class AuthController extends StateNotifier<User?> {
  final FirebaseAuth auth;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthController(this.auth, this.firestore) : super(auth.currentUser);

  Future<bool> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = userCredential.user;

      // Save user data to Firestore
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'pass': password,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print('SignUp Error: $e');
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = userCredential.user;
      return true;
    } catch (e) {
      print('SignIn Error: $e');
      return false;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    state = null;
  }
}
