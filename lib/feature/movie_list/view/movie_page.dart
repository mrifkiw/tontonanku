import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/bookmark/bookmark.dart';
import 'package:tontonanku/feature/movie_list/movie_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.title});

  final String title;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
    // context.read<TodoProvider>().fetch();
    context.read<MovieProvider>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookmarkPage(),
                    barrierDismissible: true,
                  ),
                );
              },
              icon: const Icon(Icons.bookmark))
        ],
      ),
      body: const MovieListCard(),
    );
  }
}
