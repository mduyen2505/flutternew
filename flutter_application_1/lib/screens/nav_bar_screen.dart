import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/Cart/cart_screen.dart';
import 'package:flutter_application_1/screens/Home/home_screen.dart';
import 'package:flutter_application_1/screens/favorite_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List screens = const [
    HomeScreen(), // Home icon
    FavoriteScreen(), // Favorite icon
    CartScreen(), // Cart icon
    Scaffold(), // Notifications icon
    Scaffold(), // Profile icon
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 249, 250),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2; // Cart icon
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.shopping_bag_rounded,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0; // Home icon
                });
              },
              icon: Icon(
                Icons.home_rounded,
                size: 30,
                color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1; // Favorite icon
                });
              },
              icon: Icon(
                Icons.favorite_rounded,
                size: 30,
                color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3; // Notifications icon
                });
              },
              icon: Icon(
                Icons.notifications_rounded,
                size: 30,
                color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4; // Profile icon
                });
              },
              icon: Icon(
                Icons.person_rounded,
                size: 30,
                color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
