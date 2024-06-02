import 'package:flutter/material.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class MovieProvider extends ChangeNotifier {
  Result<Movies> data = const NoData();

  final MovieRepository _repo = MovieRepositoryImpl();
  int page = 1;

  void fetch() async {
    if (data.value == null) {
      data = const Loading();
      data = await _repo.fetchData(page);
    } else {
      final oldDataList = data.value?.results;

      data = await _repo.fetchData(page);
      data.value!.results?.insertAll(0, oldDataList as Iterable<Movie>);
    }
    page++;

    notifyListeners();
  }
}
