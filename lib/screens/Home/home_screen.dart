import 'package:HDTech/models/computer_model.dart';
import 'package:HDTech/screens/Home/Widget/banner_app_bar.dart';
import 'package:HDTech/screens/Home/Widget/filter_drawer.dart';
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
  Map<String, dynamic> filters = {}; // Store filters here
  List<Computer> _computers = []; // Store filtered computers
  List<String> bannerUrls = [];
  bool _isRefreshing = false;
  final GlobalKey<PopularComputerBarState> popularComputerBarKey =
      GlobalKey<PopularComputerBarState>();

  @override
  void initState() {
    super.initState();
    _fetchBannerUrls();
    _fetchComputers(); // Fetch all computers initially without filters
    _refreshData();
  }

  // Hàm tải URL banner
  Future<void> _fetchBannerUrls() async {
    final List<Computer> computers = await loadComputers();
    setState(() {
      bannerUrls = computers
          .where((computer) => computer.bannerUrl != null)
          .map((computer) => computer.bannerUrl!)
          .toList();
    });
  }

  // Hàm làm mới dữ liệu
  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
    });
    await Future.delayed(const Duration(seconds: 2)); // Giả lập làm mới dữ liệu
    _fetchComputers(); // Re-fetch all computers without filters
    popularComputerBarKey.currentState
        ?.reloadComputers(); // Reload lại thông tin máy tính
    setState(() {
      _isRefreshing = false;
    });
  }

  // Handle filter changes and update the computer list
  void _onFilterChanged(Map<String, dynamic> filters) {
    _fetchComputers(
        filters: filters); // Fetch computers with the applied filters
    _refreshData(); // Automatically reload after applying the filters
  }

  Future<void> _fetchComputers({Map<String, dynamic>? filters}) async {
    // Fetch all computers if no filters are applied
    List<Computer> computers = await loadComputers(filters: filters);
    setState(() {
      _computers =
          computers; // Update the computers list with the filtered list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      drawer: FilterDrawer(
        computers: _computers.isEmpty
            ? []
            : _computers, // Pass the computers list (empty if no products are fetched yet)
        onFilterChanged: (filters) {
          _onFilterChanged(filters); // Handle the filter changes here
        },
      ),
      body: Builder(
        builder: (context) => RefreshIndicator(
          onRefresh: _refreshData, // Khi kéo xuống để làm mới
          child: CustomScrollView(
            slivers: [
              // AppBar tùy chỉnh với bộ lọc
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                elevation: 0,
                title: CustomAppBar(
                  onFilterChanged: _onFilterChanged, // Pass filter handler here
                ),
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
                              BannerAppBar(
                                  bannerUrls: bannerUrls), // Hiển thị banner
                              const SizedBox(height: 10),
                              const TrademarkAppBar(), // Hiển thị thương hiệu
                              const SizedBox(height: 10),
                              PopularComputerBar(
                                key: popularComputerBarKey,
                                computers:
                                    _computers, // Ensure this list is updated
                                filters: filters,
                                isRefreshing:
                                    _isRefreshing, // Pass the refresh state
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
      ),
    );
  }
}
