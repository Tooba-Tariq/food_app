import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants/app_colors.dart';

class PromotionTab extends StatelessWidget {
  const PromotionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Center(child: Container(
        height: (MediaQuery.of(context).size.width * 0.251),
                  width: (MediaQuery.of(context).size.width * 0.75),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text(
                            "Are you hungry",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColor.themePrimary,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Chinese In Restaurant",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        "Don't wait visit us and enjoy the lowest rates before these raises again.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),),
    );
  }
}
