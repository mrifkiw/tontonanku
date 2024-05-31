import 'package:flutter/material.dart';
import 'package:tontonanku/model/todo.dart';
import 'package:tontonanku/repository/todo_repository.dart';
import 'package:tontonanku/view/movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.repo,
  });

  final TodoRepository repo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Todos>(
        future: repo.getTodos(),
        builder: (context, snapshot) {
          
          return switch (snapshot.connectionState) {
            ConnectionState.waiting => const CircularProgressIndicator(),
            ConnectionState.done => ListView.builder(
                itemCount: snapshot.data?.todos?.length,
                itemBuilder: (context, index) {
                  
                  final todo = snapshot.data?.todos?[index];
                  if (todo == null) return const SizedBox.shrink();
                  return MovieCard(todo: todo);
                },
              ),
            _ => const Text('Tidak ada data'),
          };
        });
  }
}
