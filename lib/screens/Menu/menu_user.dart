import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Menu/Widget/account_app_bar.dart';
import 'package:flutter_application_1/screens/Menu/Widget/app_setting.dart';
import 'package:flutter_application_1/screens/Menu/Widget/menu_login_app.dart';
import 'package:flutter_application_1/screens/Menu/Widget/title_account_app_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MenuUser extends StatefulWidget {
  const MenuUser({super.key});

  @override
  State<MenuUser> createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  bool _isLoggedIn = false; // Biến trạng thái để theo dõi xem người dùng đã đăng nhập hay chưa

  void _handleLogin() {
    setState(() {
      _isLoggedIn = true; // Thay đổi trạng thái để mô phỏng đăng nhập
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
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
                children: [
                  const SizedBox(height: 25),
                  if (_isLoggedIn) ...[
                    const TitleAccountAppBar(),
                    const AccountPage(),
                    const SizedBox(height: 15),
                    const AppSetting(),
                  ] else ...[
                    // Sử dụng MenuLoginApp khi chưa đăng nhập
                    MenuLoginApp(onLogin: _handleLogin),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}