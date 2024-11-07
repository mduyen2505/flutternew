import 'package:flutter/material.dart';

class MyImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final List<String> images;

  const MyImageSlider({
    super.key,
    required this.images,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text("Image not available"),
              );
            },
          );
        },
      ),
    );
  }
}
