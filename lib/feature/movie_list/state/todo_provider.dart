
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class TodoProvider extends ChangeNotifier {
  Result<Todos> data = const NetworkNone();

  final TodoRepository _repo = TodoRepositoryImpl();

  TodoProvider();

  void fetch() async {
    print(data.status);
    data = const NetworkLoading();
    print("setelah fetch ${data.status}");
    data = await _repo.getTodos();
    print("setelah fetch ${data.data}");
    notifyListeners();
  }
  
}