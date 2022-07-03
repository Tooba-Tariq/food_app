import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../model/favorite_item.dart';
import '../server.dart';

class FavoriteItemCrud {
  static addFavoriteItem(FavoriteItem favorite) async {
    try {
      Map<String, dynamic> body = {
        'id': favorite.id,
        'userId': favorite.userId,
        'itemId': favorite.itemId,
      };
      var response = await Dio()
          .post(server + 'addFavorite.php', data: FormData.fromMap(body));
      // print(response);
      return response;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static fetchFavorite(String id) async {
    Map<String, dynamic> body = {
      'id': id,
    };

    try {
      Response response = await Dio()
          .post(server + 'readFavorite.php', data: FormData.fromMap(body));
      print(response.data);
      if (response.toString() != "error") {
        var data = jsonDecode(response.data);
        return data;
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  static deleteFavorite(String id) async {
    print(id);
    Map<String, dynamic> body = {
      'id': id,
    };

    Response response = await Dio()
        .post(server + 'deleteFavorite.php', data: FormData.fromMap(body));

    print(response);
  }
}
