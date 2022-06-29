import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../server.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CouponCRUD {
  static readItemData() async {
    try {
      final Response response =
          await http.get(Uri.parse(server + 'readcoupon.php'));
      // print(response.body);
      List<dynamic> value = jsonDecode(response.body);

      return value;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
