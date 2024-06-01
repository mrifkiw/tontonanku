import 'package:dio/dio.dart';

import '../../../helper/helper.dart';
import '../movie_list.dart';

abstract class MovieRepository {
  Future<Result<Movies>> fetchData(int page);
}

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Result<Movies>> fetchData(int page) async {
    try {
      const baseUrl = String.fromEnvironment("tmdb_url");

      var queryParameters = {
        "include_adult": "false",
        "include_video": "false",
        "language": "en-US",
        "page": page,
        "sort_by": "popularity%2Edesc",
      };

      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer ${const String.fromEnvironment("tmdb_token")}",
      };

      final res = await Dio().get(
        "$baseUrl/discover/movie",
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      if (res.statusCode == 200) {
        final Movies movies = Movies.fromJson(res.data);

        return DataSuccess(data: movies);
      } else {
        throw Exception('Failed to fetch data. Status code: ${res.statusCode}');
      }
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
