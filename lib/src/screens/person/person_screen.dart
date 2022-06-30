import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../blocs/user_bloc.dart';

// ignore: must_be_immutable
class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  var user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    String? id = user.email;
    await context.read<UserBloc>().fetchUsers(id!.toString());
    return Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    var userData = context.watch<UserBloc>().user;
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // }
          print(snapshot);
          if (context.watch<UserBloc>().user.firstName == null) {
            return RefreshIndicator(
              onRefresh: getData,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Something Went Wrong!"),
                  ],
                ),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        //container for profile
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(2, 2),
                                  blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(userData.image)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userData.firstName.toString() +
                              " " +
                              userData.lastName.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userData.bio.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColor.themeSecondary,
                          ),
                        ),
                        // orange container
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 360,
                          color: Colors.white,
                          child: Column(children: [
                            //first row
                            Row(
                              children: const [
                                // first container
                                // dashboardMethod(
                                //     Icons.photo_library, "Photos", "(120)"),
                                // dashboardMethod(Icons.star, "Review", "(40)"),
                                // dashboardMethod(Icons.emoji_people_sharp,
                                //     "Following", "(280)"),
                              ],
                            ),
                            //second row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // first container
                                // dashboardMethod(
                                //     Icons.discount, "Promotions", "(16-)"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: dashboardMethod(
                                      Icons.euro_symbol_rounded,
                                      "Coupons",
                                      "(10)"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: dashboardMethod(
                                      Icons.shopping_cart_outlined,
                                      "Cart",
                                      "(100)"),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(children: [
                            // bottomCards(Icons.people, "General Settings"),
                            bottomCards(
                                Icons.perm_identity, "Profile Settings  "),
                            // bottomCards(
                            //     Icons.location_on_outlined, "Shipping Details"),
                            // bottomCards(Icons.payment_rounded, "Payment Details"),
                          ]),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  bottomCards(IconData icon, String text) {
    return SizedBox(
      height: 60,
      width: 360,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColor.themeSecondary,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.themeSecondary,
              )
            ],
          ),
        ),
      ),
    );
  }

  dashboardMethod(IconData icon, String title, String number) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.orange,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //first icon
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}
