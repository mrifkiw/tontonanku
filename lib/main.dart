import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';
import 'package:tontonanku/feature/bookmark/model/movie_adapter.dart';
import 'package:tontonanku/feature/bookmark/state/bookmark_provider.dart';

import 'feature/movie_list/movie_list.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      ),
      body: const MovieListCard(),
    );
  }
}
