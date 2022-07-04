// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/blocs/item_bloc.dart';
import 'package:food_app/src/blocs/user_bloc.dart';
import 'package:food_app/src/model/favorite_item.dart';
import 'package:provider/provider.dart';

import '../../blocs/favorite_item_bloc.dart';
import '../../model/item.dart';
import '../../widget/home/heading.dart';
import '../../widget/home/item_slider.dart';
import '../../widget/home/promotion_item.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    getItem();
  }

  Future<void> getItem() async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    context.read<UserBloc>().fetchUsers(email);
    await context.read<ItemBloc>().fetchItems();
    await context.read<FavoriteItemBloc>().fetchFavorite(email);
    return Future.delayed(Duration.zero);
  }

  List<Item> filterItems(
    List<Item> items,
    String label,
  ) {
    List<Item> filterItems = [];
    for (var element in items) {
      if (element.status == label) {
        filterItems.add(element);
      }
    }
    return filterItems;
  }

  List<Item> hotItem = [];
  List<Item> featuredItem = [];
  List<Item> dealItem = [];
  List<Item> items2 = [];
  @override
  Widget build(BuildContext context) {
    items2 = [];
    hotItem = [];
    featuredItem = [];
    dealItem = [];
    items2 = context.watch<ItemBloc>().items;
    hotItem = filterItems(items2, 'Hot');
    featuredItem = filterItems(items2, 'Featured');
    dealItem = filterItems(items2, 'Deal');
    return RefreshIndicator(
      onRefresh: getItem,
      child: items2.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SearchScreen(item: items2),
                      ),
                      ItemDealSlider(
                        items: dealItem,
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Tag(
                      //         title: "Burgers",
                      //         color: const Color(0xFFFCF4CE),
                      //       ),
                      //       Tag(
                      //         title: "Pizzas",
                      //         color: const Color(0xFFFFE1E1),
                      //       ),
                      //       Tag(
                      //         title: "Chinese",
                      //         color: const Color(0xFFC9FFDA),
                      //       ),
                      //       Tag(
                      //         title: "Ice Cream",
                      //         color: const Color(0xFFFFE1E1),
                      //       ),
                      //       GestureDetector(
                      //         onTap: (() async {
                      //           await ItemCRUD.readItemData();
                      //         }),
                      //         child: Tag(
                      //           title: "Sodas",
                      //           color: const Color(0xFFD5F9FF),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Heading(
                        title: "Hot",
                        subtitle: "",
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hotItem.length,
                            itemBuilder: (context, index) {
                              return Items(
                                id: hotItem[index].id,
                                imageUrl: hotItem[index].imageUrl,
                                title: hotItem[index].name,
                                subtitle: hotItem[index].description,
                                rating: hotItem[index].status,
                                price: hotItem[index].price,
                                stripVisible: true,
                                num: index % 2,
                              );
                            }),
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: Heading(title: "Featured", subtitle: ""),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: featuredItem.length,
                            itemBuilder: (context, index) {
                              return Items(
                                id: featuredItem[index].id,
                                imageUrl: featuredItem[index].imageUrl,
                                title: featuredItem[index].name,
                                subtitle: featuredItem[index].description,
                                rating: featuredItem[index].status,
                                price: featuredItem[index].price,
                                stripVisible: false,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'No Food Items',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
    );
  }
}
