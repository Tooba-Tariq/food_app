// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}