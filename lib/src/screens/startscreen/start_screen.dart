import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.asset("assets/images/logo.png"),
            ),
            Text(
              "Welcome!",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 27.0,
                color: Colors.black,
              ),
            ),
            Text(
              "\nEat Food App allow you to find best \n foods and restaurant around you!",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 260.0, right: 50.0, left: 50.0),
              child: OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Don't Wait, Get Started!",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 17.0,
                        color: const Color(0XFFF2A902),
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
          ],
        ),
      ),
    );
  }
}
