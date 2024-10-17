import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MenuLoginApp extends StatelessWidget {
  final VoidCallback onLogin; // Callback để xử lý đăng nhập

  const MenuLoginApp({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7, // Đặt chiều cao của Container
        alignment: Alignment.center, // Căn giữa theo chiều dọc
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tiêu đề
            const Text(
              'Log in to continue using the service',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Khoảng cách giữa tiêu đề và các nút
            
            // Nút Đăng Nhập với hiệu ứng
            ZoomTapAnimation(
              child: SizedBox(
                width: 200, // Chiều rộng cố định cho nút Đăng Nhập
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Giảm padding chiều ngang
                  ),
                  onPressed: onLogin,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "images/icons/login-3-svgrepo-com.svg",
                            height: 30,
                          ),
                          const SizedBox(width: 8), // Khoảng cách giữa icon và chữ
                          const Text(
                            'Log In', // Đã dịch sang tiếng Anh
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Icon bên phải
                      SvgPicture.asset(
                        "images/icons/alt-arrow-right-svgrepo-com.svg",
                        height: 30, // Chiều cao icon bên phải
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14), // Giảm khoảng cách giữa các nút
            
            // Nút Đăng Ký với hiệu ứng
            ZoomTapAnimation(
              child: SizedBox(
                width: 200, // Chiều rộng cố định cho nút Đăng Ký
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "images/icons/login-3-svgrepo-com.svg",
                            height: 30,
                          ),
                          const SizedBox(width: 8), // Khoảng cách giữa icon và chữ
                          const Text(
                            'Sign Up', // Đã dịch sang tiếng Anh
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Icon bên phải
                      SvgPicture.asset(
                        "images/icons/alt-arrow-right-svgrepo-com.svg",
                        height: 30, // Chiều cao icon bên phải
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}