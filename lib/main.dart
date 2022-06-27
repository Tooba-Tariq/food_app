// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/blocs/item_bloc.dart';
import 'src/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';

import 'src/screens/start/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(Duration.zero);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleLoginBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => ItemBloc(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
