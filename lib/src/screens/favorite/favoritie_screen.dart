import 'package:flutter/material.dart';

class Favorite_Deals extends StatelessWidget {
  const Favorite_Deals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            cardss(),
            cardss(),
            cardss(),
            cardss(),
          ],
        ),
      ),
    );

    //
    ;
  }

  Container cardss() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 380,
      height: 100,
      child: Card(
        child: Center(
          child: SizedBox(
            height: 120,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 150,
                  child: Image.asset("images/chinese.PNG"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Chinese In Resturant",
                        style: TextStyle(color: Colors.black),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Resturant Chinese Food | \$\$",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            "4.5  ",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text("(Based on 100 reviews)",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }

//elevated button
  Appbar_elevated_button(IconData icon) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(
        icon,
        color: Colors.yellow,
      ),
      style: ElevatedButton.styleFrom(
        //background color of button

        elevation: 3,

        primary: Colors.white, //elevation of button
        shape: RoundedRectangleBorder(
            //to set border radius to button
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
