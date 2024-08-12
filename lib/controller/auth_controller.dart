import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
      (ref) => AuthController(FirebaseAuth.instance, FirebaseFirestore.instance,GoogleSignIn()),
);

class AuthController extends StateNotifier<User?> {
  final FirebaseAuth auth;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn;

  AuthController(this.auth, this.firestore, this.googleSignIn) : super(auth.currentUser);

  Future<bool> signUp(String email, String password, String name ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = userCredential.user;

      // Save user data to Firestore
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': name,
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
  String? get uid => state?.uid;

  Future<void> signOut() async {
    await auth.signOut();
    state = null;
  }
  Future<void>signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleauth = await user!.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken, idToken: googleauth.idToken);
    await auth.signInWithCredential(credentials);
    state = auth.currentUser;
  }
}