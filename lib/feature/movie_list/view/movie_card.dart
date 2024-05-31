import 'package:flutter/material.dart';

import '../movie_list.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}" ?? "",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 2 - 16 * 3,
                height: 120,
                errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      width: 150,
                      color: Colors.red,
                    ),
                loadingBuilder: (context, child, loadingProgress) =>
                    Center(child: child)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title ?? "",
                    style: Theme.of(context).textTheme.titleSmall),
                Text(movie.releaseDate.toString(),
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
