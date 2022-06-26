import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  Stream<User?> get currentUser => _auth.authStateChanges();
  Future signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future logout() => _auth.signOut();
}
