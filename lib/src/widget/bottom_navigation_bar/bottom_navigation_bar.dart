// ignore_for_file: camel_case_types, unused_field, unused_element, prefer_const_constructors, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';
import 'package:food_app/src/screens/home/home_screen.dart';
import 'package:food_app/src/screens/inbox/inbox.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int _selectedPageIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Home',
      'route': HomeScreen(),
    },
    {
      'title': 'News Feed',
      'route': Text('News Feed'),
    },
    {
      'title': 'Inbox',
      'route': InboxScreen(),
    },
    {
      'title': 'Favorities',
      'route': Text('Favorites'),
    },
    {
      'title': 'Person',
      'route': Text('Person'),
    },
  ];
  @override
  void initState() {
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      body: _pages[_selectedPageIndex]['route'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColor.themePrimary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wifi_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
