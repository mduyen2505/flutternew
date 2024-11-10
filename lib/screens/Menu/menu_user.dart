import 'package:HDTech/screens/Auth/register_screen.dart';
import 'package:HDTech/screens/Auth/login_screen.dart';
import 'package:HDTech/screens/Menu/Widget/account_app_bar.dart';
import 'package:HDTech/screens/Menu/Widget/app_setting.dart';
import 'package:HDTech/screens/Menu/Widget/menu_login_app.dart';
import 'package:HDTech/screens/Menu/Widget/title_account_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuUser extends StatefulWidget {
  const MenuUser({super.key});

  @override
  State<MenuUser> createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  bool _isLoggedIn = false; // Biến để theo dõi trạng thái đăng nhập

  @override
  void initState() {
    super.initState();
    _loadLoginStatus(); // Đảm bảo trạng thái đăng nhập được tải khi khởi tạo
  }

  void _loadLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn =
          prefs.getBool('isLoggedIn') ?? false; // Kiểm tra trạng thái đăng nhập
    });
  }

  void _handleLogin() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );

    // Kiểm tra kết quả trả về
    if (result == true) {
      setState(() {
        _isLoggedIn = true; // Cập nhật trạng thái khi đăng nhập thành công
      });
      _saveLoginStatus(true); // Lưu trạng thái đăng nhập
    }
  }

  void _saveLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isLoggedIn', status); // Lưu trạng thái vào SharedPreferences
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
                    MenuLoginApp(
                      onLogin: _handleLogin,
                      onSignUp: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScene(),
                          ),
                        );
                      },
                    ),
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
