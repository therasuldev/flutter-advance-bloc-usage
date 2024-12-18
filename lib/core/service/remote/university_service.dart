import 'package:advance_bloc_usage/core/models/university.dart';
import 'package:advance_bloc_usage/core/service/api_client.dart';
import 'package:dio/dio.dart';

final class UniversityService {
  static UniversityService? _instance;
  static UniversityService get instance => _instance ??= UniversityService._();

  late Dio _dio;

  UniversityService._() {
    _dio = ApiClient.instance.dio;
  }

  Future<List<University>> fetchUniversity({required String country}) async {
    try {
      final response = await _dio.get('/search?country=$country');
      final List<dynamic> data = response.data;
      return data.map((university) => University.fromJson(university)).toList();
    } catch (e) {
      return [];
    }
  }
}
