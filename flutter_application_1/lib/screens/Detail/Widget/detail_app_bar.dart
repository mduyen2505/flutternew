import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          // Phần Text ở giữa
          const Text(
            "Product Details",
            style: TextStyle(
              color: Color(0xFF1A242F),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          // Nút yêu thích
          IconButton(
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            icon: SvgPicture.asset(
              'images/icons/favorite-svgrepo-com.svg', //
              height: 24, // Kích thước tùy chỉnh
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
