import 'package:flutter/material.dart';

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
                IconButton(
                  onPressed: () {
                    // final bookmark = Provider.of<BookmarkProvider>(context, listen: false);
                    // // bookmark.save(widget.movie);
                    // bookmark.fetch();
                    //
                    // log(bookmark.data.toString());

                    setState(() {
                      // log(widget.movie.title.toString());
                      isBookmark = !isBookmark;
                    });
                  },
                  icon:
                      Icon(isBookmark ? Icons.bookmark : Icons.bookmark_border),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
