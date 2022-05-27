import 'package:flutter/material.dart';
import '../../../core/util/logo_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/util/gredient_circle.dart';
import '../../widget/startscreenwidget/overlay_start_screen.dart';

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
          children: [
             Positioned( 
            bottom: -50,
            right: -150,
              child: const GradientCircle(
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
