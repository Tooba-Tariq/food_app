// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PromotionItem extends StatelessWidget {
  String title;
  String subtitle;
  String imageUrl;
  String rating;
  bool stripVisible;
  int num = 0;
  PromotionItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
    this.stripVisible = false,
    this.num = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: stripVisible ? 220.0 : 194,
        width: 190.0,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 2.0,
                spreadRadius: 2,
                offset: const Offset(
                  2,
                  2,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Visibility(
                visible: stripVisible,
                child: Container(
                  height: 26,
                  width: 190,
                  decoration: BoxDecoration(
                    color: num == 0 ? Colors.red : Colors.orange,
                    borderRadius: stripVisible
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: (Radius.circular(10)),
                          )
                        : BorderRadius.circular(0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 150,
                        child: Center(
                          child: Text(
                            'Flat 50% Off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.east_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 130,
                width: 190,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: !stripVisible
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: (Radius.circular(10)),
                        )
                      : BorderRadius.circular(0),
                ),
                child: ClipRRect(
                  borderRadius: !stripVisible
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: (Radius.circular(10)),
                        )
                      : BorderRadius.circular(0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    // height: 150,
                    // width: 200,
                    // scale: 4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                        ),
                        Text(rating),
                      ],
                    ),
                    //  Text(
                    //               locationsSlides[counter]['rating'].toString(),
                    //               style: const TextStyle(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w900,
                    //                 color: Colors.white,
                    //                 letterSpacing: 2,
                    //               ),
                    //             ),
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Center(
                        child: Icon(
                          Icons.favorite_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
