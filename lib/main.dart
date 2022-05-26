import 'package:flutter/material.dart';
import 'src/screens/startscreen/splash_screen.dart';
import 'src/screens/startscreen/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}
