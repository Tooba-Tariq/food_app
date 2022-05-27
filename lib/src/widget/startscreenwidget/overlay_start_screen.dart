import 'package:flutter/material.dart';
import 'package:food_app/src/screens/loginscreen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/util/logo_widget.dart';

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                  top: 75,
                ),
                child: Logo(
                  height: 100,
                  width: 100,
                ),
              ),
              Text(
                "Welcome!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  fontSize: 28.0,
                  color: Colors.black,
                ),
              ),
              Text(
                "\nEat Food App allow you to find best \n foods and restaurant around you!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 50,
            ),
            child: Container(
              height: 50,
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const LoginScreen())));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Don't Wait, Get Started!",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0,
                            color: const Color(0XFFF2A902),
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0XFFF2A902),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
