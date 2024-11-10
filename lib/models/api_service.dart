import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'config.dart'; // Thêm import này\

final Logger logger = Logger();

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
        return {
          'error': 'Đăng nhập thất bại, vui lòng kiểm tra lại thông tin.'
        };
      }
    } catch (e) {
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
        return false; // Đăng ký thất bại
      }
    } catch (e) {
      return false; // Đăng ký thất bại do lỗi mạng
    }
  }

  Future<bool> verifyOtp(String email, String otpToken) async {
    logger.d('Email: $email');
    logger.d('OTP Token: $otpToken');

    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/otp/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'otpToken': otpToken,
        }),
      );

      logger.d('Response Status Code: ${response.statusCode}');
      logger.d('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        logger.d('Parsed Response: $jsonResponse');

        // Kiểm tra trường message
        if (jsonResponse['message'] == 'User registered successfully') {
          return true; // OTP verified successfully
        } else {
          return false; // OTP verification failed
        }
      } else {
        return false; // Nếu mã trạng thái không phải 201, trả về false
      }
    } catch (e) {
      logger.d('Exception occurred: $e');
      return false; // Nếu có lỗi trong quá trình gọi API
    }
  }
}
