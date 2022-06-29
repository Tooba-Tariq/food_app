import 'package:flutter/material.dart';
import 'package:food_app/src/model/coupon.dart';
import '../services/coupon/coupon_crud.dart';
import '/src/model/coupon.dart';

class CouponBloc extends ChangeNotifier {
  List<Coupon> _coupon = [];

  List<Coupon> get coupon => _coupon;

  fetchCoupon() async {
    _coupon = [];
    List<dynamic> coupon = await CouponCRUD.readItemData();
    List<Coupon> listFeed = coupon.map((singleItem) {
  
      return Coupon(
        id: singleItem['id'].toString(),
        code: singleItem['code'].toString(),
        discount: singleItem['discount'].toString(),
        description: singleItem['description'].toString(),
        image: singleItem['image'].toString(),
        name: singleItem['name'].toString(),
        userId: singleItem['userId'].toString(),
        validity: singleItem['validity'].toString(),
      );
    }).toList();
    _coupon.addAll(listFeed);
    notifyListeners();
  }
}
