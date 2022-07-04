// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/core/util/custom_page_route.dart';
import 'package:food_app/src/blocs/favorite_item_bloc.dart';
import 'package:food_app/src/blocs/user_bloc.dart';
import 'package:food_app/src/model/favorite_item.dart';
import 'package:food_app/src/screens/item/item_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/item.dart';

class Items extends StatefulWidget {
  String title;
  String id;
  String subtitle;
  String imageUrl;
  String rating;
  double price;
  bool stripVisible;
  int num = 0;
  Items({
    Key? key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
    this.stripVisible = false,
    this.num = 0,
    required this.price,
  }) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: widget.stripVisible ? 220.0 : 194,
        width: 190.0,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 2.0,
                spreadRadius: 2,
                offset: const Offset(
                  2,
                  2,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Visibility(
                visible: widget.stripVisible,
                child: Container(
                  height: 26,
                  width: 190,
                  decoration: BoxDecoration(
                    color: widget.num == 0 ? Colors.red : Colors.orange,
                    borderRadius: widget.stripVisible
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: (Radius.circular(10)),
                          )
                        : BorderRadius.circular(0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 150,
                        child: Center(
                          child: Text(
                            'Flat 50% Off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.east_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CustomPageRoute(
                      builder: MenuItemScreen(
                        item: Item(
                          id: widget.id,
                          name: widget.title,
                          description: widget.subtitle,
                          imageUrl: widget.imageUrl,
                          price: widget.price,
                          status: widget.rating,
                        ),
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 190,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: !widget.stripVisible
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: (Radius.circular(10)),
                              )
                            : BorderRadius.circular(0),
                      ),
                      child: ClipRRect(
                        borderRadius: !widget.stripVisible
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: (Radius.circular(10)),
                              )
                            : BorderRadius.circular(0),
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          // height: 150,
                          // width: 200,
                          // scale: 4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: AppColor.themePrimary,
                        ),
                        Text(widget.rating),
                      ],
                    ),
                    //  Text(
                    //               locationsSlides[counter]['rating'].toString(),
                    //               style: const TextStyle(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w900,
                    //                 color: Colors.white,
                    //                 letterSpacing: 2,
                    //               ),
                    //             ),
                    FavoriteButton(id: widget.id),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!context
            .read<FavoriteItemBloc>()
            .favoriteItems
            .any((item) => item.itemId == widget.id)) {
          await context.read<FavoriteItemBloc>().addFavorite(
                FavoriteItem(
                  id: const Uuid().v1(),
                  itemId: widget.id,
                  userId: context.read<UserBloc>().user.id,
                ),
              );
        } else {
          String value = '';
          context.read<FavoriteItemBloc>().favoriteItems.forEach((element) {
            if (element.itemId == widget.id) {
              value = element.id;
            }
          });
          await context.read<FavoriteItemBloc>().deleteFavorite(value);
        }
        setState(() {});
      },
      child: CircleAvatar(
        radius: 12,
        backgroundColor: context
                .watch<FavoriteItemBloc>()
                .favoriteItems
                .any((item) => item.itemId == widget.id)
            ? Colors.red
            : Colors.grey.shade300,
        child: Center(
          child: Icon(
            Icons.favorite_rounded,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
