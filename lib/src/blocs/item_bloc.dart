import 'package:flutter/material.dart';
import 'package:food_app/src/services/item/item_crud.dart';

import '../model/item.dart';

class ItemBloc extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  fetchItems() async {
    _items = [];
    List<dynamic> item = await ItemCRUD.readItemData();
    List<Item> listItem = item.map((singleItem) {
      return Item(
        id: singleItem['id'].toString(),
        name: singleItem['name'].toString(),
        description: singleItem['description'].toString(),
        price: double.parse(singleItem['price'].toString()),
        status: singleItem['status'].toString(),
        imageUrl: singleItem['image'].toString(),
      );
    }).toList();
    _items.addAll(listItem);
    notifyListeners();
  }
}
