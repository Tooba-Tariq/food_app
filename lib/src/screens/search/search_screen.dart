// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_app/src/blocs/item_bloc.dart';
import 'package:food_app/src/model/item.dart';
import 'package:search_page/search_page.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, required this.item}) : super(key: key);
  final List<Item> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(Uuid().v1());
        showSearch(
          context: context,
          delegate: SearchPage<Item>(
            items: item,
            barTheme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.orange),
                backgroundColor: Colors.white,
                textTheme: ThemeData.light().textTheme.copyWith(
                      subtitle1: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
              ),
            ),
            showItemsOnEmpty: true,
            searchStyle: const TextStyle(color: Colors.white),
            searchLabel: 'Search people',
            suggestion: const Center(
              child: Text('Filter item by name'),
            ),
            failure: const Center(
              child: Text('No item found :('),
            ),
            filter: (item) => [
              item.name,
              item.description,
              item.imageUrl,
              item.status,
            ],
            builder: (item) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.grey.shade100,
                              offset: Offset(2, 2))
                        ]),
                    width: 280,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height: 90,
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 75,
                                height: 75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 90,
                                        child: Text(
                                          item.description,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      // Row(
                                      //   children: const [
                                      //     Icon(Icons.star, color: Colors.yellow),
                                      //     Text(
                                      //       "4.5  ",
                                      //       style: TextStyle(color: Colors.black),
                                      //     ),
                                      //     Text(
                                      //       "(Based on 100 reviews)",
                                      //       style: TextStyle(
                                      //         color: Colors.black,
                                      //         fontSize: 10,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_rounded)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: 334,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Icon(
              (Icons.search_rounded),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Searching here|',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
    ;
  }
}
