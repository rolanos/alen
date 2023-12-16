import 'package:alen/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signIn(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      preferences.setString('email', email.trim());
      preferences.setString('password', password.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      rethrow;
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      preferences.setString('email', email.trim());
      preferences.setString('password', password.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
