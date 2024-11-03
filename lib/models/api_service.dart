import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart'; // Thêm import này

class ApiService {
  final String baseUrl = Config.baseUrl; // Sử dụng baseUrl từ Config

  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/user/sign-in'), // Cập nhật URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Chuyển đổi response body thành Map
        return jsonDecode(response.body);
      } else {
        // Thêm thông báo lỗi dựa trên mã trạng thái
        print('Error: ${response.statusCode}, ${response.body}');
        return {'error': 'Đăng nhập thất bại, vui lòng kiểm tra lại thông tin.'};
      }
    } catch (e) {
      print('Caught error: $e');
      return {'error': 'Đã xảy ra lỗi mạng, vui lòng thử lại.'};
    }
  }

  Future<bool> signUp(String name, String email, String password,
      String confirmPassword, String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/user/sign-up'), // Cập nhật URL
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
        return true; // Đăng ký thành công
      } else {
        print('Error: ${response.body}');
        return false; // Đăng ký thất bại
      }
    } catch (e) {
      print('Caught error: $e');
      return false; // Đăng ký thất bại do lỗi mạng
    }
  }
}