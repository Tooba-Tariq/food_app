import 'package:flutter/material.dart';
import '../feed/news_feed_screen.dart';
import '../person/person_screen.dart';
import '../../../core/util/custom_page_route.dart';
import '../login/login_screen.dart';

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

  List<AppBar> get appBar => [
        AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.adaptive.arrow_back,
                color: AppColor.themePrimary,
              ),
              splashRadius: 20,
              onPressed: () {
                returnToHomePage();
              }),
          elevation: 0,
          title: const Text(
            'Inbox',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ];
  List<Map<String, dynamic>> _pages() => [
        {
          'appBar': AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu_rounded,
                    color: AppColor.themePrimary,
                  ),
                  splashRadius: 20,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                const Text(
                  "Current Location",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColor.themePrimary,
                )
              ],
            ),
            actions: [
              PopupMenuButton(
                splashRadius: 20,
                onSelected: (value) {
                  if (value == 'Logout') {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CustomPageRoute(builder: const LoginScreen()),
                      (route) => false,
                    );
                  }
                },
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: AppColor.themePrimary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'Logout',
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.logout_rounded,
                            color: AppColor.themePrimary,
                            size: 30,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
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
                splashRadius: 20,
                onPressed: () {
                  returnToHomePage();
                }),
            title: const Text(
              'News Feed',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          'route': const NewsFeedScreen(),
        },
        {
          'appBar': appBar[0],
          'route': InboxScreen(
            appBar[0].preferredSize.height,
            context,
          ),
        },
        {
          'appBar': AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.adaptive.arrow_back,
                  color: AppColor.themePrimary,
                ),
                onPressed: () {
                  returnToHomePage();
                }),
            elevation: 0,
            title: const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          'route': const Text('Favorites'),
        },
        {
          'appBar': AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.adaptive.arrow_back,
                  color: AppColor.themePrimary,
                ),
                onPressed: () {
                  returnToHomePage();
                }),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'My Account',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              IconButton(
                  splashRadius: 20,
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: AppColor.themePrimary,
                  ),
                  onPressed: () {}),
            ],
          ),
          'route': const PersonScreen(),
        },
      ];
  @override
  void initState() {
    super.initState();
  }

  void returnToHomePage() {
    setState(() {
      _selectedPageIndex = 0;
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _selectedPageIndex == 0 ? const NavigationDrawer() : null,
      appBar: _pages()[_selectedPageIndex]['appBar'],
      body: _pages()[_selectedPageIndex]['route'],
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
