import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/util/custom_page_route.dart';
import '../../../core/util/logo_widget.dart';
import '../../screens/login/login_screen.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
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
                style: Theme.of(context).textTheme.headline4,
              ),
              const Text(
                "\nEat Food App allow you to find best \n foods and restaurant around you!",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
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
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      builder: const LoginScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Don't Wait, Get Started!",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                            color: AppColor.themePrimary,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColor.themePrimary,
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
