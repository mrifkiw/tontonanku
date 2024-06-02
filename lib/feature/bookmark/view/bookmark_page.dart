import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tontonanku/feature/bookmark/bookmark.dart';

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
      body: Center(
        child: Consumer<BookmarkProvider>(builder: (context, provider, child) {
          return Text("${provider.data.value?.length}");
        }),
      ),
    );
  }
}
