import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/util/custom_page_route.dart';
import '../../blocs/auth_bloc.dart';
import '../../blocs/user_bloc.dart';
import '../../screens/cart/cart.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key, required this.pageIndex}) : super(key: key);
  final Function pageIndex;

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    String? id = user.email;
    await context.read<UserBloc>().fetchUsers(id!);
    Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(context),
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
                  color: AppColor.themePrimary,
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ListTile(
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
                              CustomPageRoute(
                                builder: const Cart(),
                              ),
                            );
                          },
                        ),
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
                          widget.pageIndex(2);
                        },
                      ),
                      // ListTile(
                      //   leading: const Icon(
                      //     Icons.stars_outlined,
                      //     color: Colors.white,
                      //   ),
                      //   title: const Text(
                      //     'Promotions',
                      //     style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 18,
                      //         color: Colors.white),
                      //   ),
                      //   onTap: () {
                      //     // Navigator.of(context).pushReplacementNamed('/');
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Icon(
                      //     Icons.group_outlined,
                      //     color: Colors.white,
                      //   ),
                      //   title: const Text(
                      //     'Following',
                      //     style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 18,
                      //         color: Colors.white),
                      //   ),
                      //   onTap: () {
                      //     // Navigator.of(context).pushReplacementNamed('/');
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Icon(
                      //     Icons.reviews_outlined,
                      //     color: Colors.white,
                      //   ),
                      //   title: const Text(
                      //     'Reviews',
                      //     style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 18,
                      //         color: Colors.white),
                      //   ),
                      //   onTap: () {
                      //     // Navigator.of(context).pushReplacementNamed('/');
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Icon(
                      //     Icons.photo_outlined,
                      //     color: Colors.white,
                      //   ),
                      //   title: const Text(
                      //     'Photos',
                      //     style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 18,
                      //         color: Colors.white),
                      //   ),
                      //   onTap: () {
                      //     // Navigator.of(context).pushReplacementNamed('/');
                      //   },
                      // ),
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
                          widget.pageIndex(1);
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
                          widget.pageIndex(3);
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
                  widget.pageIndex(4);
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
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 170,
                              width: 300,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(
                                        'Are you Sure?\nYou want to Logout',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(),
                                              onPressed: () {
                                                context
                                                    .read<AuthBloc>()
                                                    .logout();
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Yes',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: AppColor.themePrimary,
                                                elevation: 0,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // onItemPressed(BuildContext context, {required int index}) {
  headerWidget(BuildContext context) {
    if (kDebugMode) {
      print(user);
    }
    var userData = context.watch<UserBloc>().user;
    return Row(
      children: [
        Container(
          height: 80.0,
          width: 20.0,
          color: AppColor.themePrimary,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(2, 2),
                    blurRadius: 2)
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(userData.image)),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                userData.firstName + ' ' + userData.lastName,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                userData.bio,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.themePrimary,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
