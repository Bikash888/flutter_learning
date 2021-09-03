import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_basic/services/general_providers.dart';
import 'package:riverpod/riverpod.dart';

abstract class FirebaseAuthenticationService {
  Stream<User?> get authStatusChange;
  User? getCurrentUser();
  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password);
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);
}

final authServiceProvider =
    Provider<AuthService>((ref) => AuthService(ref.read));

class AuthService implements FirebaseAuthenticationService {
  final Reader _read;
  const AuthService(this._read);

  @override
  Stream<User?> get authStatusChange =>
      _read(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() {
    return _read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
