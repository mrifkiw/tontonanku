import 'package:dio/dio.dart';
import 'package:tontonanku/helper/network/result.dart';
import '../movie_list.dart';

abstract class TodoRepository {
  Future<Result<Todos>> getTodos();
}

class TodoRepositoryImpl extends TodoRepository {
  final _dio = Dio();
  @override
  Future<Result<Todos>> getTodos() async {
    try {
      final res = await _dio.get('https://jsonplaceholder.typicode.com/photos');
      if (res.statusCode == 200) {
        final Todos todos = Todos.fromJson(res.data);
        print("di repo data: $todos");
        return NetworkSuccess( data: todos);
      } else {
        throw Exception('Failed to fetch data. Status code: ${res.statusCode}');
      }
    } catch (e) {
      return NetworkError(message: e.toString());
    }
  }
}
