import 'package:flutter/material.dart';
import 'package:food_app/src/blocs/news_feed_bloc.dart';
import 'package:provider/provider.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> getData() async {
    await context.read<NewsFeedBloc>().fetchFeed();
    return Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (context.watch<NewsFeedBloc>().feed.isEmpty) {
            return Center(child: Text("No Feed"));
          }
          return RefreshIndicator(
            onRefresh: getData,
            child: ListView.builder(
              itemCount: context.watch<NewsFeedBloc>().feed.length,
              itemBuilder: (context, index) {
                dynamic feed = [];
                feed = context.watch<NewsFeedBloc>().feed;
                print(feed);
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(feed[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      feed[index].title,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      feed[index].seller,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 55,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
                                )
                              ],
                            ),

                            //first 2 pictures

                            Container(
                              height: 200,
                              width: 250,
                              child: Image.network(
                                feed[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 275,
                              child: Text(
                                feed[index].description,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       IconButton(
                            //         onPressed: () {},
                            //         icon: const Icon(Icons.thumb_up_alt_outlined),
                            //       ),
                            //       const Text("5.2K"),
                            //       const SizedBox(
                            //         width: 5,
                            //       ),
                            //       IconButton(
                            //         onPressed: () {},
                            //         icon: const Icon(Icons.message_rounded),
                            //       ),
                            //       const Text("100"),
                            //       const SizedBox(
                            //         width: 5,
                            //       ),
                            //       IconButton(
                            //         onPressed: () {},
                            //         icon: const Icon(Icons.share_rounded),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  Container image() {
    return Container(
      child: Image.asset(
        ("assets/images/food3.png"),
        fit: BoxFit.none,
        scale: 5,
      ),
      height: 100,
      width: 130,
      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
    );
  }
}
