import 'package:flutter/material.dart';
import 'package:food_app/src/model/coupon.dart';

import '../../../core/constants/app_colors.dart';

class CouponTab extends StatelessWidget {
  const CouponTab({Key? key, required this.coupon}) : super(key: key);
  final List<Coupon> coupon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coupon.length,
      itemBuilder: (context, index) => Center(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/coupon.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 4,
              right: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      coupon[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 4,
                    right: 8,
                    bottom: 8,
                  ),
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        coupon[index].name,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            coupon[index].discount + '.00',
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColor.themePrimary,
                            ),
                          ),
                          Container(
                            color: AppColor.themePrimary,
                            width: 1,
                            height: 20,
                          ),
                          Text(
                            coupon[index].validity,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        coupon[index].description,
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
