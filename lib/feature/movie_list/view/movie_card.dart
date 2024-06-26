import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/bookmark/bookmark.dart';

import '../movie_list.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  final bool isBookmark;

  const MovieCard({super.key, required this.movie, required this.isBookmark});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  late bool isBookmark;

  @override
  void initState() {
    super.initState();
    isBookmark = widget.isBookmark;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
                "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
                fit: BoxFit.cover,
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.movie.title ?? "",
                        style: Theme.of(context).textTheme.titleSmall),
                    Text(widget.movie.releaseDate.toString(),
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                BookmarkButton(
                  isBookmark: isBookmark,
                  onPressed: () {
                    setState(() {
                      isBookmark = !isBookmark;
                    });

                    final provider =
                        Provider.of<BookmarkProvider>(context, listen: false);

                    if (isBookmark) {
                      provider.save(widget.movie);
                    } else {
                      provider.delete(widget.movie);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
  final bool isBookmark;
  final void Function()? onPressed;
  const BookmarkButton(
      {super.key, required this.isBookmark, required this.onPressed});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(widget.isBookmark ? Icons.bookmark : Icons.bookmark_border),
    );
  }
}
