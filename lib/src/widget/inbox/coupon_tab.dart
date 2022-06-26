import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CouponTab extends StatelessWidget {
  const CouponTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Center(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/coupon.png"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/images/coupon1.png"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Chinese In Restaurant",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "20.00",
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColor.themePrimary,
                            ),
                          ),
                          const Text(
                            "Oct 20, 04:00 am \nto 10:00 pm",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "For Orders Over 200",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.themePrimary,
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
