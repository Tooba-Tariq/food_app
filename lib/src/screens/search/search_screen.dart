// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: SearchPage<Person>(
            items: people,
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
            filter: (person) => [
              person.name,
              person.surname,
              person.age.toString(),
            ],
            builder: (person) => SizedBox(
              width: 350,
              child: Card(
                child: Center(
                  child: SizedBox(
                    height: 120,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Image.asset("assets/images/chinese.PNG"),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Chinese In Resturant",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Resturant Chinese Food | \$\$",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text(
                                    "4.5  ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text("(Based on 100 reviews)",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_rounded)),
                      ],
                    ),
                  ),
                ),
              ),
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
  }
}
