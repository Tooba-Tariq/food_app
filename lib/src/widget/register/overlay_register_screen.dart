import 'package:flutter/material.dart';
import 'package:food_app/src/screens/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OverlayRegisterScreen extends StatelessWidget {
  const OverlayRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 18.0),
              child: SizedBox(
                height: 35.0,
                width: 40.0,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.zero,
                    primary: const Color.fromARGB(255, 255, 206, 90),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
        Row(
          children: [
            Container(
              height: 50.0,
              width: 20.0,
              color: Colors.white,
            ),
            Text(
              "  REGISTER",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 38.0,
                color: Colors.white,
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
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(),
                const SizedBox(
                  height: 70.0,
                ),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0XFFF2A902),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const WelcomeScreen()),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Next",
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
        const SizedBox(
          height: 15.0,
        ),
        TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: ((context) => const RegisterScreen1()),
            //   ),
            // );
          },
          child: Text(
            "Terms & Conditions",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
              color: const Color(0XFFF2A902),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: ((context) => const RegisterScreen1()),
            //   ),
            // );
          },
          child: Text(
            "Already Have An Account?Log In",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
              color: Colors.white,
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
