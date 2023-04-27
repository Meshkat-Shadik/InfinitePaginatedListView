import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v_2/infrastructure/post_dto.dart';
import 'package:riverpod_v_2/infrastructure/post_repository.dart';

part 'providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));
  return dio;
}

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepositoryImpl(
    dio: ref.watch(dioProvider),
    url: 'https://jsonplaceholder.typicode.com/posts?_limit=10&_page=',
  );
}

@riverpod
Future<List<Post>> posts(PostsRef ref, {required int page}) async {
  ref.keepAlive();
  return Future.delayed(const Duration(seconds: 3), () async {
    return await ref.watch(postRepositoryProvider).getPosts(page);
  });
}

//this is the efficient way to build a listview with riverpod
//by default it is nothing but a provider that throws an error
//later we will override it with a value via ProviderScope
@riverpod
Post post(PostRef ref) {
  throw UnimplementedError();
}
