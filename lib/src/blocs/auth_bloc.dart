import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import '../services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc with ChangeNotifier {
  // final authService = AuthService();
  // final fb = FacebookLogin();

  // Stream get currentUser => authService.currentUser;
  // loginFacebook() async {
  //   if (kDebugMode) {
  //     print('Starting Facebook Login');
  //   }

  //   final res = await fb.logIn(
  //     permissions: [
  //       FacebookPermission.publicProfile,
  //       FacebookPermission.email,
  //     ],
  //   );
  //   final FacebookAccessToken? _accessToken = res.accessToken;

  //   final AuthCredential credential =
  //       FacebookAuthProvider.credential(_accessToken!.token);

  //   final result = await authService.signInWithCredential(credential);

  //   if (kDebugMode) {
  //     print('${result.user.displayName} is now logged In');
  //   }

  //   switch (res.status) {
  //     case FacebookLoginStatus.success:
  //       if (kDebugMode) {
  //         print(res);
  //       }
  //       if (kDebugMode) {
  //         print('It Worked');
  //       }

  //       break;
  //     case FacebookLoginStatus.cancel:
  //       if (kDebugMode) {
  //         print('There user canceled the login');
  //       }

  //       break;
  //     case FacebookLoginStatus.error:
  //       if (kDebugMode) {
  //         print('There was an error');
  //       }
  //       break;
  //     default:
  //   }
  // }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  logout() async {
    // await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  UserCredential? emailUser;

  registerWithEmail(String email, String password) async {
    try {
      emailUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(user);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  loginWithEmail(String email, String password) async {
    try {
      emailUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(user);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  emailLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}
