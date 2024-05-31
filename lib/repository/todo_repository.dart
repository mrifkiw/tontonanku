
import 'package:dio/dio.dart';
import 'package:tontonanku/model/todo.dart';

abstract class TodoRepository {
  Future<Todos> getTodos();
}

class TodoRepositoryImpl extends TodoRepository {
  final _dio = Dio();
  @override
  Future<Todos> getTodos() async {
    print("fetch");
    try {
      final res = await _dio.get('https://jsonplaceholder.typicode.com/photos');
      print(res.data);
      final Todos todos = Todos.fromJson(res.data);
      print(todos);
      return todos;
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }
}
