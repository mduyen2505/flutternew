import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Thiết lập chiều cao cho Container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, // Căn trái cho các phần tử
        children: [
          // Tiêu đề Account
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 20, // Kích thước chữ lớn hơn cho tiêu đề
              fontWeight: FontWeight.bold, // Đậm
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20), // Khoảng cách giữa tiêu đề và button

          // Thông tin tài khoản
          ZoomTapAnimation(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                minimumSize: const Size(150, 50), // Kích thước tối thiểu
              ),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(12), // Thêm padding cho Container
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red[600]!, // Màu đỏ đậm
                      Colors.red[200]!, // Màu đỏ nhạt
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10), // Bo tròn góc
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "images/dell-alienware-x16-2024.jpg",
                            height: 60, // Tăng chiều cao ảnh
                            width: 60, // Đảm bảo chiều rộng bằng chiều cao
                            fit: BoxFit.cover, // Đảm bảo ảnh không bị méo
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
                          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái chữ
                          children: [
                            Text(
                              'Nguyen Van A',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold, // Làm đậm chữ
                                color: Colors.white, // Màu chữ trắng để nổi bật
                              ),
                            ),
                            SizedBox(height: 4), // Khoảng cách giữa tiêu đề và email
                            Text(
                              'email@example.com', // Thay thế bằng email thực tế
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70, // Màu chữ email
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Icon bên phải
                    SvgPicture.asset(
                      "images/icons/ruler-cross-pen-svgrepo-com.svg",
                      height: 25, // Chiều cao icon bên phải
                      // ignore: deprecated_member_use
                      color: Colors.white, // Màu icon trắng
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16), // Tạo khoảng cách giữa hai button

          // Button đầu tiên với hiệu ứng
          ZoomTapAnimation(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(150, 50), // Kích thước tối thiểu
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "images/icons/bell-svgrepo-com.svg",
                        height: 25,
                      ),
                      const SizedBox(width: 12), // Khoảng cách giữa icon và chữ
                      const Text(
                        'Notification Setting',
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

          const SizedBox(height: 16), // Tạo khoảng cách giữa hai button

          // Button thứ hai với hiệu ứng
          ZoomTapAnimation(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(150, 50), // Kích thước tối thiểu
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "images/icons/cart-2-svgrepo-com.svg",
                        height: 30,
                      ),
                      const SizedBox(width: 12), // Khoảng cách giữa icon và chữ
                      const Text(
                        'Shipping Address',
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

          const SizedBox(height: 16),

          // Button thứ ba với hiệu ứng
          ZoomTapAnimation(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(150, 50), // Kích thước tối thiểu
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "images/icons/wallet-svgrepo-com.svg",
                        height: 30,
                      ),
                      const SizedBox(width: 12), // Khoảng cách giữa icon và chữ
                      const Text(
                        'Payment Info',
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

          const SizedBox(height: 16),

          // Button thứ tư với hiệu ứng
          ZoomTapAnimation(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(150, 50), // Kích thước tối thiểu
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "images/icons/trash-bin-trash-svgrepo-com.svg",
                        height: 30,
                      ),
                      const SizedBox(width: 12), // Khoảng cách giữa icon và chữ
                      const Text(
                        'Delete Account',
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

          const SizedBox(height: 16),

          // Button thứ năm với hiệu ứng
          ZoomTapAnimation(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(150, 50), // Kích thước tối thiểu
              ),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "images/icons/logout-3-svgrepo-com.svg",
                        height: 30,
                      ),
                      const SizedBox(width: 12), // Khoảng cách giữa icon và chữ
                      const Text(
                        'Logout',
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
        ],
      ),
    );
  }
}