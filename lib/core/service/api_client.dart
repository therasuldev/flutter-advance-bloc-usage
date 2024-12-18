import 'package:dio/dio.dart';

// http://universities.hipolabs.com/search?country=azerbaijan

final class ApiClient {
  static ApiClient? _instance;
  static ApiClient get instance => _instance ??= ApiClient._();

  late Dio dio;

  ApiClient._() {
    dio = Dio();
    dio.options.baseUrl = 'http://universities.hipolabs.com';
    dio.options.headers = {'Content-Type': 'application/json'};
  }
}
