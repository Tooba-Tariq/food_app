import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

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
        // isTopSafeArea: true,
        done: const Text(
          'Done',
          style: TextStyle(color: Colors.white),
        ),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const TabScreen()),
            ),
          );
        },
        globalBackgroundColor: AppColor.themePrimary,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.white,
          color: AppColor.themePrimary,
        ),
        next: Text(
          'Next',
          style: TextStyle(color: Colors.white),
        ),
        pages: [
          PageViewModel(
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              imageFlex: 3,
              bodyPadding: EdgeInsets.zero,
            ),
            title: 'Find your nearby food places\nand your favourite foods',
            body: '',
            image: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1.5,
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          PageViewModel(
            decoration: const PageDecoration(
              imageFlex: 3,
              titleTextStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              bodyPadding: EdgeInsets.zero,
            ),
            title: "Get your favorite food delivered at\n your door step.",
            body: "",
            image: Container(
              height: 500,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: const Color(0xFFFFF1D6),
                child: Center(
                  child: SizedBox(
                    height: 300,
                    child: Image.asset(
                      "assets/images/pic.png",
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
