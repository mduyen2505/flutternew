import 'dart:convert';

import 'package:http/http.dart' as http; // Thêm dòng này.

class Computer {
  final String id; // Thêm trường id
  final String name;
  final String image;
  final double price;
  final double rating;
  final String description;

  Computer({
    required this.id, // Thêm tham số id vào constructor
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      id: json['_id'], // Lấy trường _id từ JSON
      name: json['name'],
      image: 'images/products/${json['image']}.jpg',
      price: (json['prices'] != null)
          ? json['prices'].toDouble()
          : 0.0, // Kiểm tra null
      rating: (json['rating'] != null)
          ? json['rating'].toDouble()
          : 0.0, // Kiểm tra null
      description:
          json['description'] ?? '', // Cung cấp giá trị mặc định nếu null
    );
  }
}

Future<List<Computer>> loadComputers() async {
  final response = await http
      .get(Uri.parse("http://192.168.1.4:3001/api/product/getAllProduct"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> data =
        jsonResponse['data']; // Lấy dữ liệu từ trường data
    return data.map((json) => Computer.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load computers');
  }
}
