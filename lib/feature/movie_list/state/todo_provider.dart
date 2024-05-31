
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../movie_list.dart';

class TodoProvider extends ChangeNotifier {
  late Todos todos;

  final TodoRepository _repo = TodoRepositoryImpl();

  TodoProvider();

  void fetch() async {
    todos = await _repo.getTodos();
    notifyListeners();
  }
  
}