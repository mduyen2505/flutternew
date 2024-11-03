import 'dart:async'; // Add this import

import 'package:flutter/material.dart';

class BannerAppBar extends StatefulWidget {
  const BannerAppBar({super.key});

  @override
  _BannerAppBarState createState() => _BannerAppBarState();
}

class _BannerAppBarState extends State<BannerAppBar> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer when disposing
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // Set the height for the banner
      child: PageView(
        controller: _pageController,
        children: [
          _buildBannerImage(
              'images/banners/1646813262_banner.jpg'), // Replace with your images
          _buildBannerImage('images/banners/ms_banner_img4.jpg'),
          _buildBannerImage('images/banners/banner-thanhlymaytinhnet.jpg'),
          _buildBannerImage('images/banners/zyro-image.png-1024x384.jpg'),
          _buildBannerImage('images/banners/1101_ctkkm-laptop-xin-1.jpg'),
        ],
      ),
    );
  }

  Widget _buildBannerImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Round the corners
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Scale the image to cover the banner
        width: double.infinity, // Make the image full width
      ),
    );
  }
}
