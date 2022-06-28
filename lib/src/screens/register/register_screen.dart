// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/util/custom_page_route.dart';
import 'package:food_app/src/screens/login/login_screen.dart';
import 'package:food_app/src/screens/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/util/gredient_circle.dart';
import '../../widget/register/overlay_register_screen.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return WelcomeScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something Went Wrong"),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: -MediaQuery.of(context).size.width * 1,
                      left: -MediaQuery.of(context).size.width * 0.5,
                      child: GradientCircle(
                        radius: MediaQuery.of(context).size.width * 1,
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                    Positioned(
                      bottom: -MediaQuery.of(context).size.width * 1.8,
                      left: -MediaQuery.of(context).size.width * 0.5,
                      child: GradientCircle(
                        radius: MediaQuery.of(context).size.width * 1,
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white.withOpacity(0.5),
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      CustomPageRoute(
                                        builder: LoginScreen(),
                                        direction: AxisDirection.right,
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Container(
                                height: 40.0,
                                width: 20.0,
                                color: Colors.white,
                              ),
                              const Text(
                                " REGISTER",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.05),
                              child: OverlayRegisterScreen(
                                parentContext: context,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
