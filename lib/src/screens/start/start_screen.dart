import 'package:flutter/material.dart';

import '../../../core/util/gredient_circle.dart';
import '../../widget/start/overlay_start_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children:const [
            Positioned(
              bottom: -160,
              left: -100,
              
              child: GradientCircle(
                radius: 150,
              ),
            ),
             Positioned(
              bottom: -160,
              left: -15,
              right: -8,
              child: GradientCircle(
                radius: 150,
              ),
            ),
             Positioned( 
            bottom: -130,
            right: -90,
              child:  GradientCircle(
                radius: 150,
              ),
            ),
          
             OverlayWidget(),
          ],
        ),
      ),
    );
  }
}
