import 'dart:developer';
import 'package:first_flutter_project/core/model/repository_model.dart';
import 'package:first_flutter_project/core/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// https://api.github.com/users/therasuldev
// https://api.github.com/users/therasuldev/repos

class ApiService {
  ApiService._();

  ApiService() {
    _dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));
  }

  late Dio _dio;

  Future<User> getUsersInformation(String username) async {
    final response = await _dio.get('/users/$username');
    final userJson = response.data;
    return User.fromJson(userJson);
  }

  Future<List<Repository>> getUsersRepositories(String username) async {
    final response = await _dio.get('/users/$username/repos');
    final repositoryJsons = response.data as List;
    final repositories = repositoryJsons.map((repoJson) => Repository.fromJson(repoJson)).toList();
    return repositories;
  }
}
