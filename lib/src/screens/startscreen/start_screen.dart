import 'package:flutter/material.dart';
import 'package:food_app/core/util/logo_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
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
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 50,
                ),
                child: Container(
                  height: 50,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
