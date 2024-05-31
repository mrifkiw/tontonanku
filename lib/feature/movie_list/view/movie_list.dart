import 'package:flutter/material.dart';

import '../movie_list.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key, required this.todos,
  });

  final Todos todos;

  @override
  Widget build(BuildContext context) {
    return switch (todos) {
      != null => ListView.builder(
          itemCount: todos.todos?.length,
          itemBuilder: (context, index) {
            final todo = todos.todos?[index];
            if (todo == null) return const SizedBox.shrink();
            return MovieCard(todo: todo);
          },
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}
