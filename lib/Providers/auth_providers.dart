import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final AuthProvider=Provider<FirebaseAuth>((ref) {
return FirebaseAuth.instance;
});

