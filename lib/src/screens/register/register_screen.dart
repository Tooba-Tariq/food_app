// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        padding: const EdgeInsets.only(left: 0),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0XFFF2A902),
                          size: 30.0,
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
                        color: const Color(0XFFF2A902),
                      ),
                      Text(
                        " REGISTER",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 30.0,
                          color: const Color(0XFFF2A902),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: OverlayRegisterScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
