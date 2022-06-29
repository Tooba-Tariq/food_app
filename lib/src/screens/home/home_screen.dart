// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app/src/blocs/item_bloc.dart';
import 'package:provider/provider.dart';

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
    await context.read<ItemBloc>().fetchItems();
    return Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    var items2 = context.watch<ItemBloc>().items;
    return RefreshIndicator(
      onRefresh: getItem,
      child: SingleChildScrollView(
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
                  items: items2,
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
                  title: "Promotions",
                  subtitle: "View All",
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: context.watch<ItemBloc>().items.length,
                      itemBuilder: (context, index) {
                        var itemFetched = context.watch<ItemBloc>().items;
                        return PromotionItem(
                          imageUrl: itemFetched[index].imageUrl,
                          title: itemFetched[index].name,
                          subtitle: itemFetched[index].description,
                          rating: itemFetched[index].status,
                          stripVisible: true,
                          num: index % 2,
                        );
                      }),
                ),
                GestureDetector(
                    onTap: () async {},
                    child: Heading(title: "Featured", subtitle: "View All")),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: context.watch<ItemBloc>().items.length,
                      itemBuilder: (context, index) {
                        var itemFetched = context.watch<ItemBloc>().items;
                        return PromotionItem(
                          imageUrl: itemFetched[index].imageUrl,
                          title: itemFetched[index].name,
                          subtitle: itemFetched[index].description,
                          rating: itemFetched[index].status,
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
      )),
    );
  }
}
