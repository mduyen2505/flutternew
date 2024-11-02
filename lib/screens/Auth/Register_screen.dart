import 'package:flutter/material.dart';
import 'package:HDTech/models/api_service.dart'; // Import ApiService
import 'package:HDTech/screens/Auth/Login_screen.dart';
import 'package:HDTech/screens/nav_bar_screen.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScene extends StatefulWidget {
  const SignUpScene({super.key});

  @override
  State<SignUpScene> createState() => _SignUpSceneState();
}

class _SignUpSceneState extends State<SignUpScene> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final ApiService _apiService = ApiService(); // Khởi tạo ApiService

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isPhoneValid = false;
  bool _isNameValid = false;

  void _validateForm() {
    setState(() {
      _isEmailValid =
          RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text);
      _isPasswordValid = _passwordController.text.length >= 8 &&
          RegExp(r'[0-9]').hasMatch(_passwordController.text) &&
          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_passwordController.text);
      _isPhoneValid = RegExp(r'^[0-9]+$').hasMatch(_phoneController.text);
      _isNameValid = _nameController.text.isNotEmpty;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _signUp() async {
    String errorMessage = '';

    if (_isEmailValid && _isPasswordValid && _isPhoneValid && _isNameValid) {
      if (_passwordController.text != _confirmPasswordController.text) {
        errorMessage = 'Mật khẩu xác nhận không khớp.';
      }

      if (errorMessage.isEmpty) {
        final success = await _apiService.signUp(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _confirmPasswordController.text,
          _phoneController.text,
        );

        if (mounted) {
          if (success) {
            _navigateToNextPage();
          } else {
            errorMessage = 'Đăng ký thất bại, vui lòng kiểm tra lại thông tin.';
          }
        }
      }
    } else {
      if (!_isNameValid) {
        errorMessage += 'Tên không được để trống.\n';
      }
      if (!_isEmailValid) {
        errorMessage += 'Email không hợp lệ. Định dạng phải là __@__.__\n';
      }
      if (!_isPhoneValid) {
        errorMessage += 'Số điện thoại không đúng.\n';
      }
      if (!_isPasswordValid) {
        errorMessage +=
            'Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ số và ký tự đặc biệt. Ví dụ: 12A3@abc\n';
      }
    }

    if (mounted && errorMessage.isNotEmpty) {
      _showErrorDialog(errorMessage);
    }
  }

  void _navigateToNextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const BottomNavBar()),
    );
  }

  void _navigateToSignIn() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
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
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  // TextField cho Tên
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _nameController,
                      onChanged: (_) => _validateForm(),
                      decoration: InputDecoration(
                        labelText: 'Name',
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
                  // TextField cho Email
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _emailController,
                      onChanged: (_) => _validateForm(),
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
                  // TextField cho Số điện thoại
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: (_) => _validateForm(),
                      decoration: InputDecoration(
                        labelText: 'Phone',
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
                  // TextField cho Mật khẩu
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      onChanged: (_) => _validateForm(),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TextField cho Xác nhận mật khẩu
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      onChanged: (_) => _validateForm(),
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Nút "Sign Up"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
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
          // Văn bản "Already have an account? Sign in"
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: _navigateToSignIn,
                  child: const Text(
                    "Sign in",
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
