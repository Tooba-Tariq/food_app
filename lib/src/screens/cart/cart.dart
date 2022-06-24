import 'dart:ui';

import 'package:flutter/material.dart';
import '../tabs/tab_screen.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 169, 43),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.2),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                },
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
        title: const Text(
          "My Cart",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 30,
            width: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.2),
                padding: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Container(
                  height: 140.0,
                  width: 350.0,
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset("assets/images/food3.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Zinger Burger",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.orange),
                                ),
                                IconButton(
                                  splashRadius: 15.0,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Small - 30",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "60.00",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22.0,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      splashRadius: 15.0,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                    const Text(
                                      "2",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 15.0,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 140.0,
                  width: 350.0,
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset("assets/images/food3.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Zinger Burger",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.orange),
                                ),
                                IconButton(
                                  splashRadius: 15.0,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Small - 30",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "60.00",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22.0,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      splashRadius: 15.0,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                    const Text(
                                      "2",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    IconButton(
                                      splashRadius: 15.0,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
