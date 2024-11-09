import 'package:HDTech/models/computer_model.dart';
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
  List<String> bannerUrls = [];
  bool _isRefreshing = false;
  final GlobalKey<PopularComputerBarState> popularComputerBarKey =
      GlobalKey<PopularComputerBarState>();

  @override
  void initState() {
    super.initState();
    _fetchBannerUrls();
  }

  Future<void> _fetchBannerUrls() async {
    final List<Computer> computers = await loadComputers();
    setState(() {
      bannerUrls = computers
          .where((computer) => computer.bannerUrl != null)
          .map((computer) => computer.bannerUrl!)
          .toList();
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    popularComputerBarKey.currentState?.reloadComputers();
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
            const SliverAppBar(
              backgroundColor: Color.fromARGB(255, 241, 241, 241),
              elevation: 0,
              title: CustomAppBar(),
              automaticallyImplyLeading: false,
              pinned: true,
              floating: false,
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
                            child: FadeInAnimation(child: widget),
                          ),
                          children: [
                            BannerAppBar(bannerUrls: bannerUrls),
                            const SizedBox(height: 10),
                            const TrademarkAppBar(),
                            const SizedBox(height: 10),
                            PopularComputerBar(
                              key: popularComputerBarKey,
                              isRefreshing: _isRefreshing,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
