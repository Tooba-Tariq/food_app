import 'package:flutter/material.dart';
import '../../../core/util/custom_page_route.dart';

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
    await Future.delayed(const Duration(seconds: 2));
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
    return const Scaffold(
      body: Center(
        child: Logo(
          height: 75,
          width: 75,
        ),
      ),
    );
  }
}
