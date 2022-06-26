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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -160,
            left: -15,
            right: -8,
            child: GradientCircle(
              radius: MediaQuery.of(context).size.width * 0.45,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          Positioned(
            bottom: -130,
            right: -90,
            child: GradientCircle(
              radius: MediaQuery.of(context).size.width * 0.4,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          Positioned(
            bottom: -160,
            left: -100,
            child: GradientCircle(
              radius: MediaQuery.of(context).size.width * 0.37,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          OverlayWidget(),
        ],
      ),
    );
  }
}
