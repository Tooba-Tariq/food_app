import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/src/blocs/favorite_item_bloc.dart';
import 'package:food_app/src/blocs/item_bloc.dart';
import 'package:food_app/src/model/favorite_item.dart';
import 'package:food_app/src/model/item.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/user_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const FavoriteItemUI();

    //
  }
}

class FavoriteItemUI extends StatefulWidget {
  const FavoriteItemUI({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteItemUI> createState() => _FavoriteItemUIState();
}

class _FavoriteItemUIState extends State<FavoriteItemUI> {
  List favorite = [];

  Future<void> getData() async {
    favorite = [];
    String userId = FirebaseAuth.instance.currentUser!.email!;
    await context.read<FavoriteItemBloc>().fetchFavorite(userId);
    if (context.read<FavoriteItemBloc>().favoriteItems.isNotEmpty) {
      (context.read<FavoriteItemBloc>().favoriteItems[0].userId);
      context.read<FavoriteItemBloc>().favoriteItems.forEach(
        (fav) {
          context.read<ItemBloc>().items.forEach(
            (item) {
              if (fav.itemId == item.id) {
                favorite.add(item);
              }
            },
          );
        },
      );
    }
    setState(() {});
    return Future.delayed(Duration.zero);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getData,
      child: Center(
        child: favorite.isNotEmpty
            ? SizedBox(
                width: 350,
                child: ListView.builder(
                    itemCount: favorite.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                offset: const Offset(2, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    favorite[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100,
                                        child: Text(
                                          favorite[index].name,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 8.0),
                                      child: Container(
                                        width: 130,
                                        child: Text(
                                          favorite[index].description +
                                              " | " +
                                              favorite[index].price.toString(),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star_rounded,
                                              color: AppColor.themePrimary),
                                          Text(
                                            favorite[index].status,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (!context
                                      .read<FavoriteItemBloc>()
                                      .favoriteItems
                                      .any((item) =>
                                          item.itemId == favorite[index].id)) {
                                    await context
                                        .read<FavoriteItemBloc>()
                                        .addFavorite(
                                          FavoriteItem(
                                            id: const Uuid().v1(),
                                            itemId: favorite[index].id,
                                            userId: context
                                                .read<UserBloc>()
                                                .user
                                                .id,
                                          ),
                                        );
                                  } else {
                                    String value = '';
                                    context
                                        .read<FavoriteItemBloc>()
                                        .favoriteItems
                                        .forEach((element) {
                                      if (element.itemId ==
                                          favorite[index].id) {
                                        value = element.id;
                                      }
                                    });
                                    await context
                                        .read<FavoriteItemBloc>()
                                        .deleteFavorite(value);
                                  }
                                  setState(() {
                                    getData();
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : Text('No Favorites Added'),
      ),
    );
  }
}
