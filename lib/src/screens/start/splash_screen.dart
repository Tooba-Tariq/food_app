import 'package:flutter/material.dart';

import '../../../core/util/custom_page_route.dart';
import '../../../core/util/gredient_circle.dart';
import '../../../core/util/logo_widget.dart';
import 'start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    loadingNextScreen();
  }


  loadingNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    
    
    Navigator.pushAndRemoveUntil(
      context,
      CustomPageRoute(
        builder: const StartScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -75,
            right: -8,
            child: GradientCircle(
              radius: MediaQuery.of(context).size.width * 0.6,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          Positioned(
            bottom: -120,
            left: -50,
            child: GradientCircle(
              radius: MediaQuery.of(context).size.width * 0.3,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          Positioned(
            right: -110,
            bottom: 100,
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/side.png'),
            ),
          ),
          Positioned(
            right: -60,
            bottom: 150,
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/circle.png'),
            ),
          ),
          const Center(
            child: Logo(
              height: 75,
              width: 75,
            ),
          ),
        ],
      ),
    );
  }
}
