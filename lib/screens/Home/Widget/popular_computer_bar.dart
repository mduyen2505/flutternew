import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/Home/Du_lieu_gia/computer_model.dart';
import 'package:flutter_application_1/screens/Detail/detail_screen.dart';
class PopularComputerBar extends StatefulWidget {
  const PopularComputerBar({super.key});

  @override
  _PopularComputerBarState createState() => _PopularComputerBarState();
}

class _PopularComputerBarState extends State<PopularComputerBar> {
  // Trạng thái để theo dõi sự phóng to/thu nhỏ
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.85,
        ),
        itemCount: computers.length,
        itemBuilder: (context, index) {
          final computer = computers[index];
          return GestureDetector(
            onTapDown: (_) {
              // Khi nhấn xuống, phóng to
              setState(() {
                _scale = 0.95; // Giảm kích thước
              });
            },
            onTapUp: (_) {
              // Khi nhả tay, thu nhỏ lại
              setState(() {
                _scale = 1.0; // Trở về kích thước ban đầu
              });
              // Điều hướng đến trang DetailScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    popularComputerBar: computer, // Truyền dữ liệu của sản phẩm
                  ),
                ),
              );
            },
            onTapCancel: () {
              // Nếu nhấn nhưng không nhả, thu nhỏ lại
              setState(() {
                _scale = 1.0;
              });
            },
            child: Transform.scale(
              scale: _scale,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(computer.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            computer.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$ ${computer.price}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: kprimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Xử lý sự kiện nhấn cho nút "Thêm"
                        print('Thêm ${computer.name} vào giỏ hàng!');
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: kprimaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
