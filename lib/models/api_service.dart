import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.50.3.161:3001/api/user';

  Future<bool> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sign-in'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Xử lý dữ liệu nếu cần thiết
      return true; // Đăng nhập thành công
    } else {
      // Xử lý lỗi
      print('Error: ${response.body}');
      return false; // Đăng nhập thất bại
    }
  }

  Future<bool> signUp(String name, String email, String password, String confirmPassword, String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sign-up'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'phone': phone,
      }),
    );

    if (response.statusCode == 200) {
      // Xử lý dữ liệu nếu cần thiết
      return true; // Đăng ký thành công
    } else {
      // Xử lý lỗi
      print('Error: ${response.body}');
      return false; // Đăng ký thất bại
    }
  }
}