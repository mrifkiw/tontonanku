import 'package:flutter/material.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class MovieProvider extends ChangeNotifier {
  Result<Movies> data = const NetworkNone();

  final MovieRepository _repo = MovieRepositoryImpl();
  int page = 1;

  void fetch() async {
    if (data.data == null) {
      data = const NetworkLoading();
      data = await _repo.fetchData(page);
    } else {
      final oldDataList = data.data?.results;

      data = await _repo.fetchData(page);
      data.data!.results?.insertAll(0, oldDataList as Iterable<Movie>);
    }
    page++;

    notifyListeners();
  }
}
