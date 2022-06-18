import 'package:flutter/material.dart';
import 'package:food_app/core/util/custom_page_route.dart';
import 'package:food_app/src/screens/login/login_screen.dart';

import '../../../core/constants/app_colors.dart';
import '../../screens/cart/cart.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 15.0,
              ),
              const Divider(
                thickness: 1.0,
                height: 10.0,
                color: Colors.grey,
              ),
              SizedBox(
                child: Container(
                  color: const Color(0XFFF2A902),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Cart',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Cart())));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.euro_symbol_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Coupons',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.stars_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Promotions',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.group_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Following',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.reviews_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Reviews',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.photo_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Photos',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.rss_feed_outlined,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'My Feed',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Favorities',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Color(0XFFF2A902),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.power_settings_new_outlined,
                  color: Color(0XFFF2A902),
                ),
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CustomPageRoute(builder: const LoginScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // onItemPressed(BuildContext context, {required int index}) {
  //   Navigator.pop(context);
  //   switch (index) {
  //     case 0:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const Cart(),
  //         ),
  //       );
  //   }
  // }

  headerWidget() {
    return Row(
      children: [
        Container(
          height: 80.0,
          width: 20.0,
          color: AppColor.themePrimary,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            height: 100.0,
            width: 100.0,
            child: Image.asset("assets/images/image.png"),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          children: const [
            Text(
              "Christopher Howell",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "(Student)",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
