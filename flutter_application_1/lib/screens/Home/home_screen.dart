import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 249, 250),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: kcontentColor,
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "images/apps-ui-application-svgrepo-com.svg",
                      height: 16,
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: kcontentColor,
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "images/bag-smile-svgrepo-com.svg",
                      height: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
