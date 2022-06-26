import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      //container for profile
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/image.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ), // profile conainer end
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Christopher Howell",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "(Student)",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: AppColor.themeSecondary,
                        ),
                      ),
                      // orange container
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 360,
                        color: Colors.white,
                        child: Column(children: [
                          //first row
                          Row(
                            children: [
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
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomCards(IconData icon, String text) {
    return Container(
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
              SizedBox(
                width: 30,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(),
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
            SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}
