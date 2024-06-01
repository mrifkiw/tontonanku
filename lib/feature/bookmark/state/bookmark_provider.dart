import 'package:flutter/foundation.dart';
import 'package:tontonanku/feature/bookmark/repository/boorkmark_repository.dart';

import '../../movie_list/movie_list.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Movie>? data;

  final BookmarkRepository _repo = BookmarkRepositoryImpl();

  void fetch() {
    data = _repo.getData();
    notifyListeners();
  }

  void save(Movie movie) {
    _repo.bookmark(movie);
    notifyListeners();
  }
}
