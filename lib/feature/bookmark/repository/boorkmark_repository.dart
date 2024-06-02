import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tontonanku/helper/helper.dart';

import '../../movie_list/movie_list.dart';

abstract class BookmarkRepository {
  Future<Result<Set<Movie>>> getData();
  Future<void> persist(Set<Movie> movies);
}

class BookmarkRepositoryImpl implements BookmarkRepository {
  static const String key = "bookmark";

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<Result<Set<Movie>>> getData() async {
    try {
      final res = (await _prefs).getStringList(key);
      final movies =
          res?.map((e) => Movie.fromJson(jsonDecode(e))).toSet() ?? {};

      return DataSuccess(data: movies);
    } catch (e) {
      throw DataError(message: e.toString());
    }
  }

  @override
  Future<void> persist(Set<Movie> movies) async {
    (await _prefs)
        .setStringList(key, movies.map((e) => jsonEncode(e.toJson())).toList());
  }
}
