import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/bookmark/state/bookmark_provider.dart';

import 'package:tontonanku/helper/helper.dart';
import 'package:tontonanku/helper/network/result.dart';

import '../movie_list.dart';

class MovieListCard extends StatefulWidget {
  const MovieListCard({super.key});

  @override
  State<MovieListCard> createState() => _MovieListCardState();
}

class _MovieListCardState extends State<MovieListCard> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleLoadMore);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_handleLoadMore);
  }

  void _handleLoadMore() {
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        MediaQuery.of(context).size.width * 0.2) {
      Provider.of<MovieProvider>(context, listen: false).fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, provider, child) {
      return switch (provider.data) {
        DataSuccess(:final data) => ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: data?.results?.length,
            itemBuilder: (context, index) {
              final movie = data?.results?[index];
              if (movie == null) return const SizedBox.shrink();

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MovieCard(
                    movie: movie,
                    isBookmark: Provider.of<BookmarkProvider>(context)
                            .data
                            ?.contains(movie) ??
                        false,
                  ),
                  if (data?.results?.last == data?.results?[index]) ...[
                    if (provider.data.status == ResultStatus.loading) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ]
                ],
              );
            },
          ),
        Loading() => const CircularProgressIndicator(),
        DataError(:final message) => Text(message ?? ""),
        NoData() => const SizedBox.shrink(),
      };
    });
  }
}
