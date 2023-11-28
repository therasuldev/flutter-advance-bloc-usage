import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_flutter_project/lesson28/core/model/news_model.dart';

abstract class INewsService {
  Future<List<NewsModel>?> getNews();
}

//https://jsonplaceholder.typicode.com/albums/5/photos

class NewsService implements INewsService {
  late final Dio _dio;
  NewsService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<NewsModel>?> getNews() async {
    try {
      final response = await _dio.get(PhotosPath.photos.path);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data as List;
        final result = datas.map((json) => NewsModel.fromJson(json)).toList();
        return result;
      }
    } on DioException catch (error) {
      log(error.message!);
    }
    return null;
  }
}

enum PhotosPath {
  photos('albums/5/photos');

  final String path;
  const PhotosPath(this.path);
}
