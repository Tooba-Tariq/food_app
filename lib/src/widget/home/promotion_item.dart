// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PromotionItem extends StatelessWidget {
  String title;
  String subtitle;
  String imageUrl;
  String rating;
  PromotionItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: 250.0,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 150.0,
              width: 250,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11.0,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.star,
                  color: Color(0XFFF2A902),
                ),
                Text("data"),
                //  Text(
                //               locationsSlides[counter]['rating'].toString(),
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w900,
                //                 color: Colors.white,
                //                 letterSpacing: 2,
                //               ),
                //             ),
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}