import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/Widget/home_app_bar.dart';
import 'package:flutter_application_1/screens/Home/Widget/popular_computer_bar.dart';
import 'package:flutter_application_1/screens/Home/Widget/search_app_bar.dart';
import 'package:flutter_application_1/screens/Home/Widget/trademark_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              //for custom appbar
              CustomAppBar(),
              SizedBox(
                height: 20,
              ),
              //for searchbar
              MySearchBar(),
              SizedBox(
                height: 20,
              ),
              //for trademarkbar
              TrademarkAppBar(),
              SizedBox(
                height: 20,
              ),
              PopularComputerBar()
            ],
          ),
        ),
      ),
    );
  }
}
