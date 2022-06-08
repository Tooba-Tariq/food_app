import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/register/register_screen.dart';

class OverlayLoginScreen extends StatelessWidget {
  OverlayLoginScreen({Key? key}) : super(key: key);
  GlobalKey _formKey = GlobalKey();
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
                child: Icon(
                  Icons.arrow_back,
                  color: AppColor.themeSecondary,
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
              color: AppColor.themePrimary,
            ),
            Text(
              " SIGN IN",
              style: TextStyle(
                fontSize: 38,
                color: AppColor.themePrimary,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      enabledBorder: InputBorder.none,
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      enabledBorder: InputBorder.none,
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
                          "Forgot Password?",
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
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.themePrimary,
                          AppColor.themeSecondary,
                        ],
                        stops: [0.6, 2],
                      ),
                    ),
                    child: TextButton(
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
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
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "Or",
            style: GoogleFonts.poppins(
              fontSize: 14.0,
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 250.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: TextButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Image.asset("assets/images/fb.png"),
                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: TextButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Image.asset("assets/images/twitter.png"),
                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: TextButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Image.asset("assets/images/google.png"),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(350),
                  topRight: Radius.circular(350),
                ),
                color: Colors.white,
              ),
              child: TextButton(
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
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
