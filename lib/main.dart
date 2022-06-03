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
          // errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                // subtitle1: TextStyle(
                //   fontFamily: 'OpenSans',
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18,
                // ),
                // button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),               
      home: const SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}
