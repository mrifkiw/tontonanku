import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'feature/bookmark/bookmark.dart';
import 'feature/movie_list/movie_list.dart';
import 'feature/movie_list/view/movie_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prepareHive();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MovieProvider()),
      ChangeNotifierProvider(create: (_) => BookmarkProvider()),
    ],
    child: const MyApp(),
  ));
}

Future<void> prepareHive() async {
  await Hive.initFlutter();
  await Hive.openBox("bookmark");
  Hive.registerAdapter(MovieAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviePage(title: 'Tontonanku'),
    );
  }
}
