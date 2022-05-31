import 'package:flutter/material.dart';
import '../../../core/util/gredient_circle.dart';
import '../../widget/register/overlay_register_screen.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: const [
            Positioned(
              top: -430,
              right: -150,
              left: -150,
              child: GradientCircle(
                radius: 450,
              ),
            ),
            Positioned(
              bottom: -680,
              right: -150,
              left: -150,
              child: GradientCircle(
                radius: 400,
              ),
            ),
            SingleChildScrollView(
              child: OverlayRegisterScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
