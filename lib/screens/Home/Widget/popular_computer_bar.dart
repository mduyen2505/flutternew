import 'package:flutter/material.dart';
import 'package:HDTech/constants.dart';
import 'package:HDTech/models/computer_model.dart';
import 'package:HDTech/screens/Detail/detail_screen.dart';

class PopularComputerBar extends StatefulWidget {
  const PopularComputerBar({super.key});

  @override
  _PopularComputerBarState createState() => _PopularComputerBarState();
}

class _PopularComputerBarState extends State<PopularComputerBar> {
  double _scale = 1.0;
  late Future<List<Computer>> futureComputers;

  @override
  void initState() {
    super.initState();
    futureComputers = loadComputers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Computer>>(
      future: futureComputers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No computers found.'));
        }

        final computers = snapshot.data!;

        return GridView.builder(
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
                setState(() {
                  _scale = 0.95;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _scale = 1.0;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      popularComputerBar: computer,
                    ),
                  ),
                );
              },
              onTapCancel: () {
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
                                image: AssetImage(
                                    computer.image), // Sử dụng AssetImage
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
        );
      },
    );
  }
}
