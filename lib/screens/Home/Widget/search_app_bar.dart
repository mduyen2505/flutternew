import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Looking for computer",
                border: InputBorder.none,
                isDense: true, // Giúp căn chỉnh gọn hơn
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10), // Căn giữa theo chiều dọc
              ),
              textAlignVertical:
                  TextAlignVertical.center, // Căn giữa theo chiều dọc
            ),
          ),
          Container(
            height: 25,
            width: 1,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
