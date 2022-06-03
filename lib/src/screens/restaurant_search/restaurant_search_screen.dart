import 'package:flutter/material.dart';

class RestaurantSearchScreen extends StatelessWidget {
  const RestaurantSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          title: const Text("Current Location"),
          //actions: [IconButton(onPressed: (){}, icon: Icon(Icons.))],
        ),
      ),
    );
  }
} 
