import 'package:flutter/foundation.dart';
import 'package:tontonanku/feature/bookmark/repository/boorkmark_repository.dart';
import 'package:tontonanku/helper/helper.dart';

import '../../movie_list/movie_list.dart';

class BookmarkProvider extends ChangeNotifier {
  Result<Set<Movie>> data = const NoData();

  final BookmarkRepository _repo = BookmarkRepositoryImpl();

  void fetch() async {
    data = const Loading();
    data = await _repo.getData();
    notifyListeners();
  }

  void save(Movie movie) {
    var data = this.data.value;
    data?.add(movie);
    _repo.persist(data ?? {});
    notifyListeners();
  }

  void delete(Movie movie) {
    var data = this.data.value;
    data?.remove(movie);
    _repo.persist(data ?? {});
    notifyListeners();
  }
}
