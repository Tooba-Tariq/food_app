import 'package:flutter/material.dart';
import '../tabs/tab_screen.dart';


class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
              child: Container(
                color: const Color.fromARGB(255, 253, 169, 43),
                height: 30.0,
                width: 40.0,
                child: IconButton(
                  splashRadius: 25.0,
                  padding: const EdgeInsets.only(left: 0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
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
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
            child: Container(
              height: 50.0,
              color: const Color.fromARGB(255, 253, 169, 43),
              child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.only(left: 0),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: const [
                // Container(
                //   color: Colors.grey,
                //   height: 80.0,
                //   width: 350.0,
                //   child: Card(

                //   ),
                // ),
                // Container(
                //   color: Colors.grey,
                //   height: 80.0,
                //   width: 350.0,
                //   child: Card(
                    
                //   ),
                // ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: const TabScreen(),
      ),
    );
  }
}
