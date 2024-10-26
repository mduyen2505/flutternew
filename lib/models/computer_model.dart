import 'dart:convert';
import 'package:flutter/services.dart'; // Giữ lại dòng này.

class Computer {
  final String name;
  final String imagePath;
  final double price;
  final double rate;
  final String description;
  final String review;
  final List<Color> colors;

  Computer({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.rate,
    required this.description,
    required this.review,
    required this.colors,
  });

  factory Computer.fromJson(Map<String, dynamic> json) {
    var colorList = (json['colors'] as List)
        .map((color) => Color(int.parse(color.replaceFirst('#', '0xFF'))))
        .toList();

    return Computer(
      name: json['name'],
      imagePath: json['imagePath'],
      price: json['price'].toDouble(),
      rate: json['rate'].toDouble(),
      description: json['description'],
      review: json['review'],
      colors: colorList,
    );
  }
}

Future<List<Computer>> loadComputers() async {
  final String response = await rootBundle.loadString("assets/computer_model.json");
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Computer.fromJson(json)).toList();
}