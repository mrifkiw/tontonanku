import 'package:flutter/material.dart';


import '../movie_list.dart';

class MovieCard extends StatelessWidget {
  final Todo todo;

  const MovieCard({
    super.key, required this.todo
  });

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
              todo.thumbnailUrl ??"",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 2 - 16 * 3,
              height: 120,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const Center(
                          child: CircularProgressIndicator()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title ?? "",
                    style: Theme.of(context).textTheme.titleSmall),
                Text(todo.albumId.toString(),
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
