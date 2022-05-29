import 'package:flutter/material.dart';
import '../../../core/util/gredient_circle.dart';
import '../../widget/login/overlay_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: -480,
              right: -150,
              left: -150,
              child: Container(
                child: const GradientCircle(
                  radius: 500,
                ),
              ),
            ),
            
            OverLayWidget(),
          ],
        ),
      ),
    );
  }
}
