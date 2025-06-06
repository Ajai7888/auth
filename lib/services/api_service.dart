import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/login_response.dart';
import '../models/dashboard_response.dart';

class ApiService {
  static const Duration timeoutDuration = Duration(seconds: 10);

  /// POST API - Login
  static Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse('http://13.127.199.200:8555/api/userLogin');
    final body = jsonEncode({
      'username': email.trim(),
      'password': password.trim(),
    });

    try {
      final response = await http
          .post(url, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponse.fromJson(data);
      } else {
        throw Exception('Login failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('Login API exception: $e');
    }
  }

  /// GET API - Fetch User Dashboard Data
  /// Optional token parameter for future use
  static Future<DashboardResponse> getUsers({String? token}) async {
    final url = Uri.parse('https://dummyjson.com/users');

    try {
      final response = await http
          .get(
            url,
            headers:
                token != null
                    ? {
                      'Authorization': 'Bearer $token',
                      'Accept': 'application/json',
                    }
                    : {'Accept': 'application/json'},
          )
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DashboardResponse.fromJson(data);
      } else {
        throw Exception(
          'Failed to fetch users. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('GET users API exception: $e');
    }
  }
}
