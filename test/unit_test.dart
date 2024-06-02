import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tontonanku/feature/bookmark/repository/boorkmark_repository.dart';
import 'package:tontonanku/feature/movie_list/movie_list.dart';
import 'package:tontonanku/helper/helper.dart';

void main() {
  late BookmarkRepository repository;

  setUp(
    () async {
      repository = BookmarkRepositoryImpl();
    },
  );

  test('getData retrieves bookmarks successfully', () async {
    final movieList = [Movie(id: 1), Movie(id: 2)];

    SharedPreferences.setMockInitialValues({
      BookmarkRepositoryImpl.key:
          movieList.map((e) => jsonEncode(e.toJson())).toList(),
    }); //set values here

    final result = await repository.getData();

    expect(result, isA<DataSuccess>());
    final data = result.value?.toList();

    expect(data, movieList);
  });

  test('persist bookmarks successfully', () async {
    final movieList = [Movie(id: 1), Movie(id: 2)];
    SharedPreferences.setMockInitialValues({
      BookmarkRepositoryImpl.key: {},
    });

    await repository.persist(movieList.toSet());
    final result = await repository.getData();

    expect(result, isA<DataSuccess>());
    final data = result.value?.toList();

    expect(data, movieList);
  });
}
