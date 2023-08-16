import 'package:dio/dio.dart';

class ApiClient {
  static const baseUrl =
      'https://fakestoreapi.com'; // Replace with your API base URL
  final Dio _dio = Dio();

  Future<Response> getRequest(String path) async {
    try {
      final response = await _dio.get('$baseUrl$path');
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<Response> postRequest(String path, dynamic data) async {
    try {
      final response = await _dio.post('$baseUrl$path', data: data);
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<Response> login(String username, String password) async {
    try {
      final response = await _dio.post('$baseUrl/auth/login', data: {
        'username': username,
        'password': password,
      });

      return response;
    } catch (error) {
      throw error;
    }
  }
}
