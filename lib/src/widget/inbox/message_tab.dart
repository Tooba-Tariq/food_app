import 'dart:math';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';

class MessageTab extends StatelessWidget {
  const MessageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Center(
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Badge(
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(
                    Random().nextInt(90).toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  position: const BadgePosition(start: -3, top: -3),
                  badgeColor: AppColor.themePrimary,
                  child: Container(
                    width: 80,
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/image2.png"),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: (MediaQuery.of(context).size.width * 0.65),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Jack Gamble",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "5 min ago",
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColor.themePrimary,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, nonumy consetetur elitr.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
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
