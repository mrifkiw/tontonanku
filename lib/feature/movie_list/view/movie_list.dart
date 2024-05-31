import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/movie_list/state/movie_provider.dart';

import 'package:tontonanku/helper/helper.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, provider, child) {
      return switch (provider.data) {
        NetworkSuccess(:final data) => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: data?.results?.length,
            itemBuilder: (context, index) {
              final movie = data?.results?[index];
              if (movie == null) return const SizedBox.shrink();
              if (data?.results?.last == data?.results?[index]) {
                print("pagination gak sih wkwk");
              }
              return MovieCard(movie: movie);
            },
          ),
        NetworkLoading() => const CircularProgressIndicator(),
        NetworkError(:final message) => Text(message ?? ""),
        NetworkNone() => const SizedBox.shrink(),
      };
    });
  }
}
