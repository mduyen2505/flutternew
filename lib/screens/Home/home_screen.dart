import 'package:HDTech/screens/Home/Widget/home_app_bar.dart';
import 'package:HDTech/screens/Home/Widget/popular_computer_bar.dart';
import 'package:HDTech/screens/Home/Widget/search_app_bar.dart';
import 'package:HDTech/screens/Home/Widget/trademark_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Hàm để làm mới dữ liệu
  Future<void> _refreshData() async {
    // Thực hiện các thao tác làm mới dữ liệu ở đây
    setState(() {
      // Cập nhật trạng thái giao diện
    });
    // Giả lập một khoảng thời gian tải dữ liệu
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: AnimationLimiter(
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
                  children: const [
                    SizedBox(height: 25),
                    CustomAppBar(),
                    SizedBox(height: 20),
                    MySearchBar(),
                    SizedBox(height: 20),
                    TrademarkAppBar(),
                    PopularComputerBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
