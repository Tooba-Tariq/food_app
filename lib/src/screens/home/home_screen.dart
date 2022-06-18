// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/home/heading.dart';
import '../../widget/home/promotion_item.dart';
import '../../widget/home/tag.dart';

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeindex = 0;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  final UrlImages = [
    'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Aurger%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fburger-with-beef-and-cheese-gm998309062-270055548%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Furger%252F%26utm_term%3Durger&hash=897f32fd6ced8f0a4d0157870b759651bb6a1504&='
        'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Apizza%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fsupreme-pizza-gm1302565865-394263820%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fpizza%252F%26utm_term%3Dpizza&hash=3803ae7042ad1464fa7ed25e67ca7bcb6a621815&='
        'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Apasta%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fpizza%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fchinese-noodles-with-chicken-and-peanuts-chinese-cuisine-food-gm547170528-98841545%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fpasta%252F%26utm_term%3Dpasta&hash=3523fc587cf8988b9321bd1c7f0100f62525b806&='
        'https://pixabay.com/link/?ua=cd3%3Dimage%26cd7%3Den%253Achinese%2Bfood%253APAK%26ec%3Dapi_ad%26ea%3Dnavigate%26el%3Dgetty%26tid%3DUA-20223345-1%26dr%3Dhttps%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fchinese%252F&next=https%3A%2F%2Fwww.istockphoto.com%2Fphoto%2Fjapanese-dumplings-gyoza-with-pork-meat-and-vegetables-gm1133151212-300660172%3Futm_source%3Dpixabay%26utm_medium%3Daffiliate%26utm_campaign%3DSRP_image_sponsored%26utm_content%3Dhttp%253A%252F%252Fpixabay.com%252Fimages%252Fsearch%252Fchinese%252520food%252F%26utm_term%3Dchinese%2Bfood&hash=341d0f41893e017db11dcd26264b8ce95a12a549&='
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 334,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: SearchPage<Person>(
                            items: HomeScreen.people,
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
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 188,
                  width: 334,
                  child: Column(
                    children: [
                      Container(
                        width: 334,
                        height: 188,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepOrange,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 334,
                                height: 188,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 1.2,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    onPageChanged: (index, reason) =>
                                        setState(() => activeindex = index),
                                  ),
                                  items: [1, 2, 3, 4, 5].map(
                                    (e) {
                                      final UrlImage = UrlImages[0];
                                      return Row(
                                        children: [
                                          Expanded(
                                              child: buildImage(UrlImage, 0)),
                                        ],
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 334,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                            horizontal: 8,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Text(
                                                    'Chienes Food',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  Text(
                                                    '12 Resturants',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: buildIndicator(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
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
    );
  }

  Widget buildImage(String urlImage, int index) => const SizedBox(
        child: AspectRatio(
          aspectRatio: 2 / 1.5,
          child: Image(
            image: AssetImage('assets/images/food4.png'),
            fit: BoxFit.fitWidth, // use this
          ),
        ),
      );
  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        effect: WormEffect(
          type: WormType.thin,
          dotHeight: 9,
          dotWidth: 9,
          dotColor: Colors.white.withOpacity(0.5),
          activeDotColor: Colors.orange,
        ),
        count: 4,
      );
}
