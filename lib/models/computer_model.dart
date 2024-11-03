import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart'; // Thêm import này

class Computer {
  final String id;
  final String name;
  final String image;
  final double price;
  final double rating;
  final String description;

  Computer({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      id: json['_id'],
      name: json['name'],
      image: 'images/products/${json['image']}.jpg',
      price: (json['prices'] != null) ? json['prices'].toDouble() : 0.0,
      rating: (json['rating'] != null) ? json['rating'].toDouble() : 0.0,
      description: json['description'] ?? '',
    );
  }
}

Future<List<Computer>> loadComputers() async {
  final response = await http.get(Uri.parse('${Config.baseUrl}/product/getAllProduct')); // Cập nhật URL

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> data = jsonResponse['data'];
    return data.map((json) => Computer.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load computers');
  }
}