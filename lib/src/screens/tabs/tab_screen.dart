import 'package:flutter/material.dart';

import '../../widget/drawer/navigation_drawer.dart';
import '/core/constants/app_colors.dart';
import '/src/screens/home/home_screen.dart';
import '/src/screens/inbox/inbox.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'appBar': AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Current Location"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      'drawer': const NavigationDrawer(),
      'route': const HomeScreen(),
    },
    {
      'appBar': AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: AppColor.themePrimary,
            ),
            onPressed: () {}),
        title: const Text('News Feed'),
      ),
      'route': const Text('News Feed'),
    },
    {
      'appBar': AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: AppColor.themePrimary,
            ),
            onPressed: () {}),
        elevation: 0,
        title: const Text('Inbox'),
      ),
      'route': const InboxScreen(),
    },
    {
      'appBar': AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: AppColor.themePrimary,
            ),
            onPressed: () {}),
        elevation: 0,
        title: const Text('Favorites'),
      ),
      'route': const Text('Favorites'),
    },
    {
      'appBar': AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: AppColor.themePrimary,
            ),
            onPressed: () {}),
        elevation: 0,
        title: const Text('Person'),
      ),
      'route': const Text('Person'),
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
      drawer: _selectedPageIndex == 0 ? const NavigationDrawer() : null,
      appBar: _pages[_selectedPageIndex]['appBar'],
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
