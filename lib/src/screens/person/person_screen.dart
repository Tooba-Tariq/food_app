import 'package:flutter/material.dart';

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
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "(student)",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.yellow,
                        ),
                      ),
                      // orange container
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 360,
                        height: 180,
                        color: Colors.white,
                        child: Column(children: [
                          //first row
                          Row(
                            children: [
                              // first container
                              dashboardMethod(
                                  Icons.photo_library, "Photos", "(120)"),
                              dashboardMethod(Icons.star, "Review", "(40)"),
                              dashboardMethod(Icons.emoji_people_sharp,
                                  "Following", "(280)"),
                            ],
                          ),
                          //second row
                          Row(
                            children: [
                              // first container
                              dashboardMethod(
                                  Icons.discount, "Promotions", "(16-)"),
                              dashboardMethod(
                                  Icons.airplane_ticket, "Coupons", "(10)"),
                              dashboardMethod(
                                  Icons.delete_forever, "Cart", "(100)"),
                            ],
                          ),
                        ]),
                      ), //Orange container end

                      //cardssssssssssssssssssss
                      Container(
                        color: Colors.white,
                        child: Column(children: [
                          bottomCards(Icons.people, "General Settings"),
                          bottomCards(
                              Icons.perm_identity, "Profile Settings  "),
                          bottomCards(
                              Icons.location_on_outlined, "Shipping Details"),
                          bottomCards(Icons.payment_rounded, "Payment Details"),
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

  Container bottomCards(IconData icon, String text) {
    return Container(
      height: 60,
      width: 360,
      child: Card(
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 30,
            ),
            Text("$text"),
            SizedBox(
              width: 170,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }

  Container dashboardMethod(IconData icon, String title, String number) {
    return Container(
      width: 120,
      height: 90,
      color: Color.fromARGB(255, 255, 170, 43),
      child: Column(
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
            "$title",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          Text("$number",
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
