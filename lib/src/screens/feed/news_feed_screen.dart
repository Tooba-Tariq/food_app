import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) =>
            //row for icon
            Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/food1.png"),
                    fit: BoxFit.none,
                    scale: 15,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Cheezy Burger",
                              style: TextStyle(fontSize: 16),
                            ),
                            const Text(
                              "Burgers Mania",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        )
                      ],
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
                      child: const Text(
                        "Hi new cutomer, we have added new burgers\nto our list and free fries for new customers. \nVisit our branch and try any of these and give \nfeedback. Thanks!",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.thumb_up_alt_outlined),
                        ),
                        const Text("5.2K"),
                        const SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message_rounded),
                        ),
                        const Text("100"),
                        const SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_rounded),
                        ),
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container image() {
    return Container(
      child: Image.asset(
        ("assets/images/food3.png"),
        fit: BoxFit.none,
        scale: 5,
      ),
      height: 100,
      width: 150,
      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
    );
  }
}
