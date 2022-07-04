import 'package:flutter/material.dart';
import 'package:food_app/src/services/newsfeed/news_feed_crud.dart';
import '/src/model/feed.dart';
import '../services/item/item_crud.dart';

class NewsFeedBloc extends ChangeNotifier {
  List<NewsFeed> _feed = [];

  List<NewsFeed> get feed => _feed;

  fetchFeed() async {
    _feed = [];
    List<dynamic> feed = await NewsFeedCRUD.readItemData();
    List<NewsFeed> listFeed = feed.map((singleItem) {
      return NewsFeed(
        id: singleItem['id'].toString(),
        title: singleItem['title'].toString(),
        seller: singleItem['seller'].toString(),
        description: singleItem['description'].toString(),
        image: singleItem['image'].toString(),
      );
    }).toList();
    _feed.addAll(listFeed);
    notifyListeners();
  }
}
