import 'package:HDTech/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:HDTech/constants.dart';
import 'package:HDTech/models/computer_model.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatefulWidget {
  final Computer popularComputerBar;

  const AddToCart({super.key, required this.popularComputerBar});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 199, 199, 199),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Widget tăng giảm số lượng sản phẩm
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex > 1) currentIndex--; // Giảm số lượng
                      });
                    },
                    iconSize: 18,
                    icon: const Icon(Icons.remove, color: Colors.white),
                  ),
                  
                  const SizedBox(width: 5),
                  Text(
                    currentIndex.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex++; // Tăng số lượng
                      });
                    },
                    iconSize: 18,
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
            
            // Nút "Add to Cart" với SnackBar tùy chỉnh
            GestureDetector(
              onTap: () {
                provider.addToCart(widget.popularComputerBar, quantity: currentIndex);

                final snackBar = SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Successfully added to cart!",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green[500],
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  action: SnackBarAction(
                    label: 'Close',
                    textColor: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                  duration: const Duration(seconds: 1),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                alignment: Alignment.center,
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
