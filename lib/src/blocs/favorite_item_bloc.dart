import 'package:flutter/material.dart';
import 'package:food_app/src/services/favorite/favorite_item_crud.dart';
import '/src/model/favorite_item.dart';

class FavoriteItemBloc extends ChangeNotifier {
  List<FavoriteItem> favoriteItems = [];

  addFavorite(FavoriteItem favoriteItem) async {
    await FavoriteItemCrud.addFavoriteItem(favoriteItem);
    favoriteItems.add(favoriteItem);
  }

  fetchFavorite(String id) async {
    favoriteItems = [];
    try {
      List feed = await FavoriteItemCrud.fetchFavorite(id);
      print(feed);
      if (feed.isNotEmpty) {
        List<FavoriteItem> listFeed = feed.map((singleItem) {
          return FavoriteItem(
            id: singleItem['id'].toString(),
            itemId: singleItem['item_id'].toString(),
            userId: singleItem['user_id'].toString(),
          );
        }).toList();
        favoriteItems.addAll(listFeed);
      }
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }

  deleteFavorite(String id) async {
    await FavoriteItemCrud.deleteFavorite(id);
    favoriteItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
