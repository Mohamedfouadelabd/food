import 'package:flutter/material.dart';
import 'package:food_app/FavoriteScreen/favorite_screen.dart';
import 'package:food_app/FoodScreen/food_screen.dart';
import 'package:food_app/HomeScreen/home_screen.dart';
import 'package:food_app/KitchenScreen/kitchen_screen.dart';
import 'package:food_app/Theme/my_Theme.dart';

import '../SearchTap/search_tap.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Search for foods',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.14,
              ),
              child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchTap());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 50,
                    color: MyTheme.primary,
                  )),
            ),
          ]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyTheme.primary),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_dining), label: 'Food'),
            BottomNavigationBarItem(
                icon: Icon(Icons.kitchen), label: 'Kitchen'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
        ),
      ),
      body: taps[selectedIndex],
    );
  }

  List<Widget> taps = [
    HomeScreen(),
    FoodScreen(),
    KitchenScreen(),
    FavoriteScreen(),
  ];
}
