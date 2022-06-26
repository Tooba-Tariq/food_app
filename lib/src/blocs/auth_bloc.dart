import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:food_app/src/services/auth_service.dart';

class AuthBloc {
  final authService = AuthService();
  final fb = FacebookLogin();

  Stream get currentUser => authService.currentUser;
  loginFacebook() async {
    print('Starting Facebook Login');

    final res = await fb.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );
    switch (res.status) {
      case FacebookLoginStatus.success:
        print('It Worked');

        break;
      case FacebookLoginStatus.cancel:
        print('There user canceled the login');

        break;
      case FacebookLoginStatus.error:
        print('There was an error');
        break;
      default:
    }
  }
}
