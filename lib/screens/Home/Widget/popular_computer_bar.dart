import 'package:HDTech/constants.dart';
import 'package:HDTech/models/computer_model.dart';
import 'package:HDTech/screens/Detail/detail_screen.dart';
import 'package:flutter/material.dart';

class PopularComputerBar extends StatefulWidget {
  final bool isRefreshing;

  const PopularComputerBar({super.key, this.isRefreshing = false});

  @override
  PopularComputerBarState createState() => PopularComputerBarState();
}

class PopularComputerBarState extends State<PopularComputerBar> {
  late Future<List<Computer>> futureComputers;
  late List<double>
      scales; // For storing the scale of each item for tap animation

  @override
  void initState() {
    super.initState();
    futureComputers = loadComputers(); // Load computers initially
    scales = []; // Initialize the list of scales for each item
  }

  // Method to reload data
  void reloadComputers() {
    setState(() {
      futureComputers = loadComputers();
    });
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

        // Initialize scales list with 1.0 for each computer if not done already
        if (scales.length != computers.length) {
          scales = List<double>.filled(computers.length, 1.0);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Transform.translate(
            offset: const Offset(0, -25), // Move up the entire widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
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
                          scales[index] = 0.95; // Scale down on tap
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          scales[index] = 1.0; // Reset scale on tap release
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
                          scales[index] = 1.0; // Reset scale if tap is canceled
                        });
                      },
                      child: Transform.scale(
                        scale: scales[index],
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
                                        image: AssetImage(computer.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
