import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../server.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ItemCRUD {
  static readItemData() async {
    try {
      final Response response =
          await http.get(Uri.parse(server + 'readItem.php'));
      // print(response.body);
      List<dynamic> value = jsonDecode(response.body);
      if (kDebugMode) {
        print(value);
      }
      return value;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
