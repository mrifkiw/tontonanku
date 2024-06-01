import 'package:hive_flutter/hive_flutter.dart';

import '../../movie_list/movie_list.dart';

abstract class BookmarkRepository {
  List<Movie> getData();
  void bookmark(Movie movie);
}

class BookmarkRepositoryImpl implements BookmarkRepository {
  final _boxName = "bookmark";
  @override
  void bookmark(Movie movie) {

    final box = Hive.box(_boxName);
    box.add(movie);
  }

  @override
  List<Movie> getData() {
    final box = Hive.box(_boxName);
    final movies = box.values.toList().cast<Movie>;
    return movies();
  }
}
