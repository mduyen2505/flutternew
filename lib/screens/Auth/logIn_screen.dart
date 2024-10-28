import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Auth/Register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/screens/nav_bar_screen.dart'; // Import trang BottomNavBar
import 'package:flutter_application_1/models/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import ApiService

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService(); // Khởi tạo ApiService

  void _navigateToNextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const BottomNavBar()), // Gọi BottomNavBar
    );
  }

  void _navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const SignUpScene()), // Gọi SignUpScene
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Gọi hàm đăng nhập
    bool success = await _apiService.signIn(email, password);

    // Kiểm tra xem widget có còn được gắn hay không
    if (!mounted) return;

    if (success) {
      // Lưu trạng thái đăng nhập
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true); // Lưu trạng thái đăng nhập

      // Điều hướng đến BottomNavBar sau khi đăng nhập thành công
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
      );
    } else {
      // Thông báo lỗi nếu đăng nhập thất bại
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập thất bại, vui lòng kiểm tra lại thông tin.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nền màu đỏ và bo tròn cho logo
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFD70014),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'images/logo-app/logo.svg',
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // TextField cho Email
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TextField cho Password
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Nút "Sign In"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _signIn, // Gọi hàm đăng nhập
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Nút "Next" nằm ở góc phải trên màn hình
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: _navigateToNextPage,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'images/icons/alt-arrow-right-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          // Văn bản "Don’t have an account? Sign Up for free" nằm ở dưới cùng
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account? "),
                GestureDetector(
                  onTap: _navigateToSignUp,
                  child: const Text(
                    "Sign Up for free",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
