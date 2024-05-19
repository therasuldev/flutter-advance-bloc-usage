import 'package:dio/dio.dart';
import 'package:first_flutter_project/core/model/user_model.dart';

class ApiService {
  late Dio? dio;
  ApiService() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));
  }

  Future<List<UserModel>> fetchUsers() async {
    final response = await dio?.get('/users');
    final data = response!.data as List<dynamic>;
    final result = data.map((userJson) => UserModel.fromJson(userJson)).toList();

    return result;
  }
}
