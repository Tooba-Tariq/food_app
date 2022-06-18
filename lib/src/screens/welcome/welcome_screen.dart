import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

import '../tabs/tab_screen.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<PageViewModel>? pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        isTopSafeArea: true,
        done: const Text('Done'),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const TabScreen()),
            ),
          );
        },
        next: Container(),
        pages: [
          PageViewModel(
            decoration: const PageDecoration(
              imageFlex: 3,
              bodyPadding: EdgeInsets.zero,
              bodyTextStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            title: 'Find your nearby food places\nand your favourite foods',
            // body: "Find your nearby food places\nand your favourite foods",
            body: '',
            image: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1.5,
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          PageViewModel(
            decoration: const PageDecoration(
              imageFlex: 3,
              bodyPadding: EdgeInsets.zero,
            ),
            title: "Get your favorite food delivered at\n your door step.",
            body: "",
            image: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: const Color(0xFFFFF1D6),
              child: SizedBox(
                height: 400,
                child: Image.asset(
                  "assets/images/pic.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
