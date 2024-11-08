import 'dart:convert';

import 'package:http/http.dart' as http;

import 'config.dart'; // Import Config for base URL

class Computer {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String company;
  final String cpu;
  final String ram;
  final String memory;
  final String gpu;
  final String weight;
  final String screenResolution;
  final String inches;
  final String quantityInStock;
  final String opsys; // New field for operating system
  final String productsTypeName; // New field for product type name
  int quantity;

  Computer({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.company,
    required this.cpu,
    required this.ram,
    required this.memory,
    required this.gpu,
    required this.weight,
    required this.screenResolution,
    required this.inches,
    required this.quantityInStock,
    required this.opsys,
    required this.productsTypeName,
    this.quantity = 1,
    
  });

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown Computer',
      imageUrl:
          json['imageUrl'] as String? ?? 'https://via.placeholder.com/150',
      price: (json['prices'] as num?)?.toDouble() ?? 0.0,
      company: json['company'] as String? ?? 'Unknown Company',
      cpu: json['cpu'] as String? ?? 'Unknown CPU',
      ram: json['ram'] as String? ?? 'Unknown RAM',
      memory: json['memory'] as String? ?? 'Unknown Memory',
      gpu: json['gpu'] as String? ?? 'Unknown GPU',
      weight: json['weight'] as String? ?? 'Unknown Weight',
      screenResolution:
          json['screenResolution'] as String? ?? 'Unknown Resolution',
      inches: json['inches'] as String? ?? 'Unknown Size',
      quantityInStock:
          json['quantityInStock'].toString(), // Ensure quantity as String
      opsys: json['opsys'] as String? ?? 'Unknown OS', // Parsing opsys
      productsTypeName: json['productsTypeName'] as String? ??
          'Unknown Type', // Parsing productsTypeName
       quantity: json['quantity'] ?? 1, // Số lượng khi tạo từ JSON
    );
  }
}

Future<List<Computer>> loadComputers() async {
  final response =
      await http.get(Uri.parse('${Config.baseUrl}/product/getAllProduct'));

  if (response.statusCode == 200) {
    try {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((json) => Computer.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to parse computers: $e');
    }
  } else {
    throw Exception(
        'Failed to load computers, status code: ${response.statusCode}');
  }
}
