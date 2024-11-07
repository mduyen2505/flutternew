import 'package:HDTech/constants.dart';
import 'package:HDTech/models/computer_model.dart';
import 'package:HDTech/screens/Detail/Widget/addto_cart.dart';
import 'package:HDTech/screens/Detail/Widget/detail_app_bar.dart';
import 'package:HDTech/screens/Detail/Widget/image_slider.dart';
import 'package:HDTech/screens/Detail/Widget/items_details.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(bottom: 10), // Adjust the bottom padding here
        child: AddToCart(popularComputerBar: widget.popularComputerBar),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverAppBar for the fixed app bar
            const SliverAppBar(
              expandedHeight: 60,
              pinned: true, // Keeps the app bar fixed at the top
              backgroundColor: kcontentColor,
              // Instead of FlexibleSpaceBar, we use a custom widget directly here
              title: DetailAppBar(),
              automaticallyImplyLeading:
                  false, // To prevent the default back button
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // Image Slider
                MyImageSlider(
                  images: [widget.popularComputerBar.imageUrl],
                  onChange: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Container for white background around ItemsDetails
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white, // Set background to white
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 0,
                    bottom: 130,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemsDetails(
                          popularComputerBar: widget.popularComputerBar),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
