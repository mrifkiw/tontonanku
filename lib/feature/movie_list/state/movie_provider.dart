import 'package:flutter/material.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class MovieProvider extends ChangeNotifier {
  Result<Movies> data = const NetworkNone();

  final MovieRepository _repo = MovieRepositoryImpl();

  void fetch() async {
    data = const NetworkLoading();
    data = await _repo.fetchData();

    notifyListeners();
  }
}
