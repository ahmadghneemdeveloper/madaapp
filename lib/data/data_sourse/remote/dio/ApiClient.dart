
import 'dart:convert';

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchData(String url, dynamic body) async {
    try {
      final response = await _dio.post(
        url,
        data: json.encode(body),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return responseData;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}