// ignore_for_file: must_be_immutable
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

class RestaurantSearchScreen extends StatefulWidget {
  const RestaurantSearchScreen({Key? key}) : super(key: key);
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

  @override
  State<RestaurantSearchScreen> createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  int activeindex = 0;
  final UrlImages = [
    'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Aurger%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fburger-with-beef-and-cheese-gm998309062-270055548%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Furger%252F%26utm_term%3Durger&hash=897f32fd6ced8f0a4d0157870b759651bb6a1504&='
        'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Apizza%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fsupreme-pizza-gm1302565865-394263820%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fpizza%252F%26utm_term%3Dpizza&hash=3803ae7042ad1464fa7ed25e67ca7bcb6a621815&='
        'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Apasta%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fpizza%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fchinese-noodles-with-chicken-and-peanuts-chinese-cuisine-food-gm547170528-98841545%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fpasta%252F%26utm_term%3Dpasta&hash=3523fc587cf8988b9321bd1c7f0100f62525b806&='
        'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Achinese%2Bfood%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fchinese%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fjapanese-dumplings-gyoza-with-pork-meat-and-vegetables-gm1133151212-300660172%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fchinese%252520food%252F%26utm_term%3Dchinese%2Bfood&hash=341d0f41893e017db11dcd26264b8ce95a12a549&='
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.clear_all_outlined),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text("Current Location"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
//               CarouselSlider(

//                 options: CarouselOptions(
//                   height: 200.0,
//                   initialPage: 0,
//                   enableInfiniteScroll: true,
//                   reverse: false,
//                   autoPlay: true,
//                   autoPlayInterval: Duration(seconds: 3),
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   enlargeCenterPage: true,
//                   scrollDirection: Axis.horizontal,
//                 ),
//                 items: [
//                   1,
//                   2,
//                   3,
//                   4,
//                 ].map((i) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage("assets/images/slider.png")),
//                             color: Colors.amber),
//                         child: Text(""),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
// //                CarouselSlider(
//    items: items,
//    options: CarouselOptions(
//       height: 400,
//       aspectRatio: 16/9,
//       viewportFraction: 0.8,
//       initialPage: 0,
//       enableInfiniteScroll: true,
//       reverse: false,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 3),
//       autoPlayAnimationDuration: Duration(milliseconds: 800),
//       autoPlayCurve: Curves.fastOutSlowIn,
//       enlargeCenterPage: true,
//       onPageChanged: callbackFunction,
//       scrollDirection: Axis.horizontal,
//    )
//  ),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      splashRadius: 20.0,
                      onPressed: () {
                        // showSearch(context: context, delegate: SearchDelegate())
                        showSearch(
                          context: context,
                          delegate: SearchPage<Person>(
                            items: RestaurantSearchScreen.people,
                            searchLabel: 'Search people',
                            suggestion: const Center(
                              child:
                                  Text('Filter people by name, surname or age'),
                            ),
                            failure: const Center(
                              child: Text('No person found :('),
                            ),
                            filter: (person) => [
                              person.name,
                              person.surname,
                              person.age.toString(),
                            ],
                            builder: (person) => ListTile(
                              title: Text(person.name),
                              subtitle: Text(person.surname),
                              trailing: Text('${person.age} yo'),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                    Container(
                      height: 230,
                      width: 350,
                      child: Column(
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              //reverse: true,
                              viewportFraction: 1,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              padEnds: true,
                              autoPlay: true,

                              autoPlayInterval: Duration(seconds: 3),
                              onPageChanged: (index, reason) =>
                                  setState(() => activeindex = index),
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index, realindex) {
                              final UrlImage = UrlImages[0];
                              return buildImage(UrlImage, index);
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          buildIndicator(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tag(
                          title: "Burgers",
                          color: const Color(0xFFFCF4CE),
                        ),
                        Tag(
                          title: "Pizzas",
                          color: const Color(0xFFFFE1E1),
                        ),
                        Tag(
                          title: "Chinese",
                          color: const Color(0xFFC9FFDA),
                        ),
                        Tag(
                          title: "Ice Cream",
                          color: const Color(0xFFFFE1E1),
                        ),
                        Tag(
                          title: "Sodas",
                          color: const Color(0xFFD5F9FF),
                        ),
                      ],
                    ),
                    Heading(
                      title: "Promotions",
                      subtitle: "View All",
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PromotionItem(
                            imageUrl: "assets/images/food.png",
                            title: "Pizzeria Restaurant",
                            subtitle: "Chinese & Italian",
                            rating: "",
                          ),
                          PromotionItem(
                            imageUrl: "assets/images/food3.png",
                            title: "Burger Mania",
                            subtitle: "Pizzas & Burgers",
                            rating: "",
                          ),
                        ],
                      ),
                    ),
                    Heading(title: "Featured", subtitle: "View All"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PromotionItem(
                            imageUrl: "assets/images/food1.png",
                            title: "Chinese Specializers",
                            subtitle: "Chinese Food Specialist",
                            rating: "",
                          ),
                          PromotionItem(
                            imageUrl: "assets/images/food4.png",
                            title: "The Italian Restaurant",
                            subtitle: "Italians Foods",
                            rating: "",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wifi_outlined,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: Colors.black,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        width: double.infinity,
        child: Image.asset(
          'assets/images/food4.png',
          fit: BoxFit.fitWidth,
        ),
      );
  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        effect: WormEffect(activeDotColor: Colors.orange),
        count: 4,
      );

  ///
}

class Heading extends StatelessWidget {
  String title;
  String subtitle;
  Heading({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class Tag extends StatelessWidget {
  String title;
  Color color;
  Tag({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () {},
        child: Text(
          title,
        ),
      ),
    );
  }
}

class PromotionItem extends StatelessWidget {
  String title;
  String subtitle;
  String imageUrl;
  String rating;
  PromotionItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: 250.0,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 150.0,
              width: 250,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11.0,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.star,
                  color: Color(0XFFF2A902),
                ),
                Text(""),
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
