import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/bookmark/bookmark.dart';
import 'package:tontonanku/feature/movie_list/movie_list.dart';
import 'package:tontonanku/helper/helper.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BookmarkProvider>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Bookmark"),
        ),
        body: Consumer<BookmarkProvider>(builder: (context, provider, child) {
          return switch (provider.data) {
            DataSuccess(value: final data) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  final movie = data?.toList()[index];
                  if (movie == null) return const SizedBox.shrink();

                  return MovieCard(
                    movie: movie,
                    isBookmark: true,
                  );
                },
              ),
            Loading() => const CircularProgressIndicator(),
            DataError(:final message) => Text(message ?? ""),
            NoData() => const SizedBox.shrink(),
          };
        }));
  }
}
