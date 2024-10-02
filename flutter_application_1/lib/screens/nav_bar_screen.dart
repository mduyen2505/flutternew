import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/Cart/cart_screen.dart';
import 'package:flutter_application_1/screens/Home/home_screen.dart';
import 'package:flutter_application_1/screens/favorite_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List screens = const [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    Scaffold(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: SvgPicture.asset(
          'images/icons/cart-2-svgrepo-com.svg',
          width: 35,
          height: 35,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: SvgPicture.asset(
                'images/icons/home-smile-svgrepo-com.svg',
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: SvgPicture.asset(
                'images/icons/heart-angle-svgrepo-com.svg',
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: SvgPicture.asset(
                'images/icons/bell-svgrepo-com.svg',
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: SvgPicture.asset(
                'images/icons/user-svgrepo-com.svg',
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(
                  currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: screens[currentIndex],
      ),
    );
  }
}
