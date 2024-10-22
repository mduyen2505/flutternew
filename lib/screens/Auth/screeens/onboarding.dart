import 'package:flutter/material.dart';
import 'widgets/body_1.dart';
import 'widgets/body_2.dart';
import 'widgets/body_3.dart';
import 'widgets/body_4.dart';
import 'widgets/welcome_header.dart';
import 'widgets/custom_navigation_bar.dart';
import 'widgets/next_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState(); // Đổi tên ở đây
}

class OnboardingState extends State<Onboarding> { // Đổi tên ở đây
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < 3) { // Chỉ số tối đa là 3 cho 4 trang
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const WelcomeHeader(), // Đảm bảo WelcomeHeader nằm ở đây
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: const [
                    Body1(),
                    Body2(),
                    Body3(),
                    Body4(),
                  ],
                ),
              ),
              // Sử dụng Row để sắp xếp CustomNavigationBar và NextPage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomNavigationBar(
                      selectedIndex: _currentPage,
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                    child: NextPage(
                      onTap: _nextPage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}