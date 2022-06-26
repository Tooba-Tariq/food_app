
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
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins', // /yeh
          textTheme: ThemeData.light().textTheme.copyWith(
                headline4: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 27,
                  color: Colors.black,
                ),
                subtitle1: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
                subtitle2: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                labelMedium: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                button: const TextStyle(
                  color: Colors.white,
                ),
              ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
              .copyWith(secondary: Colors.white)),
      home: const SplashScreen(),
    );
  }
}
