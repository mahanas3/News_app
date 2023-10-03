import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentification {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signUp({required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }
}
