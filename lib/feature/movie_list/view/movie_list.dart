import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/movie_list/state/todo_provider.dart';
import 'package:tontonanku/helper/helper.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key
  });


  @override
  Widget build(BuildContext context) {


    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        return switch (provider.data) {
          NetworkSuccess(:final data) => ListView.builder(
              itemCount: data?.todos?.length,
              itemBuilder: (context, index) {
                final todo = data?.todos?[index];
                if (todo == null) return const SizedBox.shrink();
                return MovieCard(todo: todo);
              },
            ),
          NetworkLoading() => const CircularProgressIndicator(),
          NetworkError(:final message) => Text(message ?? ""),
          
         NetworkNone() => const SizedBox.shrink(),
          
        };
      }
    );
  }
}
