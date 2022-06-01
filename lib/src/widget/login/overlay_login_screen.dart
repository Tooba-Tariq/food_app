import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/register/register_screen.dart';

class OverlayLoginScreen extends StatelessWidget {
  const OverlayLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 80,
              child: TextButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0XFFF2A902),
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: 50.0,
              width: 20.0,
              color: const Color(0XFFF2A902),
            ),
            Text(
              " SIGN IN",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 38.0,
                color: const Color(0XFFF2A902),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Container(
          height: 320.0,
          width: 320.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 20.0, right: 20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "User Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Colors.black,
                          textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0XFFF2A902),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => const WelcomeScreen())));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "Or",
            style: GoogleFonts.poppins(
              fontSize: 14.0,
            ),
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: TextButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Image.asset("assets/images/fb.png"),
                ),
              ),
              SizedBox(
                child: TextButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Image.asset("assets/images/twitter.png"),
                ),
              ),
              SizedBox(
                child: TextButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Image.asset("assets/images/google.png"),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const RegisterScreen1()),
              ),
            );
          },
          child: Text(
            "Create new account",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
              color: Colors.black,
              textStyle: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
