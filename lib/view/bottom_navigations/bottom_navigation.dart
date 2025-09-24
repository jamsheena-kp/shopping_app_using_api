import 'package:flutter/material.dart';
import 'package:shopping_app_using_api/view/bottom_navigations/cart_screen.dart';
import 'package:shopping_app_using_api/view/bottom_navigations/saved_screen.dart';
import 'package:shopping_app_using_api/view/bottom_navigations/settings_screen.dart';
import 'package:shopping_app_using_api/view/home_screen/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedScreenIndex = 0;
  final List bottomScreens = [
    HomeScreen(),
    SavedScreen(),
    CartScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomScreens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          selectedScreenIndex = index;
          setState(() {});
        },
        currentIndex: selectedScreenIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
