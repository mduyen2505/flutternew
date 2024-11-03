import 'package:HDTech/screens/Home/Widget/banner_app_bar.dart';
import 'package:HDTech/screens/Home/Widget/home_app_bar.dart';
import 'package:HDTech/screens/Home/Widget/popular_computer_bar.dart';
import 'package:HDTech/screens/Home/Widget/trademark_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isRefreshing = false;

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            // SliverAppBar for the custom app bar
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 241, 241, 241),
              elevation: 0,
              title: const CustomAppBar(), // Your CustomAppBar widget
              pinned: true, // Keeps the app bar pinned at the top
              floating: false, // Don't allow the app bar to float
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 500),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: [
                            const BannerAppBar(),
                            const SizedBox(height: 10),
                            const TrademarkAppBar(),
                            PopularComputerBar(
                              isRefreshing: _isRefreshing,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount:
                      1, // Since we're using a single child for the list
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
