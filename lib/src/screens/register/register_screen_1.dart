import 'package:flutter/material.dart';
import '../../../core/util/gredient_circle.dart';
import '../../widget/register/overlay_register_screen_1.dart';

class RegisterScreen1 extends StatelessWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

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
            OverLayWidget(),
          ],
        ),
      ),
    );
  }
}
