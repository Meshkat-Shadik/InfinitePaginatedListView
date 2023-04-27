//https://jsonplaceholder.typicode.com/posts?_limit=10

import 'package:dio/dio.dart';
import 'package:riverpod_v_2/infrastructure/post_dto.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int page);
}

class PostRepositoryImpl implements PostRepository {
  final Dio dio;
  final String url;

  PostRepositoryImpl({
    required this.dio,
    required this.url,
  });

  @override
  Future<List<Post>> getPosts(int page) async {
    final response = await dio.get('$url$page');
    final posts = (response.data as List)
        .map(
          (e) => Post.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    return posts;
  }
}
