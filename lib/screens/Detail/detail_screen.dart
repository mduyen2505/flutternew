import 'package:flutter/material.dart';
import 'package:HDTech/constants.dart';
import 'package:HDTech/screens/Detail/Widget/addto_cart.dart';
import 'package:HDTech/screens/Detail/Widget/description.dart';
import 'package:HDTech/screens/Detail/Widget/detail_app_bar.dart';
import 'package:HDTech/screens/Detail/Widget/image_slider.dart';
import 'package:HDTech/screens/Detail/Widget/items_details.dart';
import 'package:HDTech/models/computer_model.dart';

class DetailScreen extends StatefulWidget {
  final Computer popularComputerBar;
  const DetailScreen({super.key, required this.popularComputerBar});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      // nút thêm vào giỏ hàng
      floatingActionButton:
          AddToCart(popularComputerBar: widget.popularComputerBar),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // nut tro ve va yeu thich
              const DetailAppBar(),
              MyImageSlider(
                image: widget.popularComputerBar.imageUrl,
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // Thay đổi số lượng này theo số lượng hình ảnh bạn có
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentImage == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black, // Đảm bảo border có màu
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetails(popularComputerBar: widget.popularComputerBar),

                    // phan color

                    // const SizedBox(height: 20),
                    // const Text(
                    //   "Color",
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    // ),
                    //   const SizedBox(height: 20),
                    // Row(
                    //   children: List.generate(
                    //     widget.popularComputerBar.colors.length,
                    //     (index) => GestureDetector(
                    //       onTap: (){
                    //         setState(() {
                    //           currentColor = index;
                    //         });
                    //       },
                    //       child: AnimatedContainer(
                    //         duration: const Duration(milliseconds:300
                    //        ),
                    //        width: 40,
                    //        height: 40,
                    //        decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: currentColor == index
                    //               ? Colors.white
                    //               : widget.popularComputerBar.colors[index],
                    //         border:currentColor ==index ?
                    //          Border.all(
                    //           color: widget.popularComputerBar.colors[index],
                    //           )
                    //           : null,
                    //           ),
                    //           padding: currentColor == index
                    //           ? const EdgeInsets.all(2)
                    //           :null,
                    //           margin: const EdgeInsets.only(right: 10),
                    //           child: Container(
                    //             width: 35,
                    //             height: 35,
                    //             decoration: BoxDecoration(
                    //             color: widget.popularComputerBar.colors[index],
                    //             shape: BoxShape.circle,
                    //             ),
                    //           ),
                    //        ),
                    //     )
                    //   )
                    //   ,
                    // ),
                    const SizedBox(height: 25),
                    // phan description
                    Description(
                      description: widget.popularComputerBar.description,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
