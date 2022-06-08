// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

class RestaurantSearchScreen extends StatelessWidget {
  const RestaurantSearchScreen({Key? key}) : super(key: key);
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
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
          child: SizedBox(
            child: Column(
              children: [
                IconButton(
                  splashRadius: 20.0,
                  onPressed: () {
                    // showSearch(context: context, delegate: SearchDelegate())
                    showSearch(
                      context: context,
                      delegate: SearchPage<Person>(
                        items: people,
                        searchLabel: 'Search people',
                        suggestion: const Center(
                          child: Text('Filter people by name, surname or age'),
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
