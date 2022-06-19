import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //row for icon
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 40, 0, 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/food1.png",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "New Cheezy Burger",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              width: 55,
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.more_vert))
                          ],
                        ),
                        Text(
                          "Burgers Mania",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        //first 2 pictures
                        Container(
                          child: Column(
                            children: [
                              Row(children: [
                                image(),
                                image(),
                              ]),
                              Row(children: [
                                image(),
                                image(),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            "Hi new cutomer, we have added new burgers\nto our list and free fries for new customers. \nVisit our branch and try any of these and give \nfeedback. Thanks!",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up_alt_outlined),
                            ),
                            Text("5.2K"),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message_rounded),
                            ),
                            Text("100"),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_rounded),
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container image() {
    return Container(
      child: Image(
        image: AssetImage("assets/images/food3.png"),
      ),
      height: 100,
      width: 150,
      margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
    );
  }
}
