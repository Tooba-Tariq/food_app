// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'src/screens/start/splash_screen.dart';

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
        accentColor: Colors.white,
      ),                 
      home: const SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}
