import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tontonanku/feature/movie_list/movie_list.dart';
import 'package:tontonanku/feature/movie_list/view/movie_card.dart';

class WidgetTesting extends StatelessWidget {
  final Widget child;
  const WidgetTesting({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }
}

void main() {
  group("Test Bookmark Feature", () {
    testWidgets('Bookmark button test pressed', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(WidgetTesting(
        child: BookmarkButton(
          isBookmark: true,
          onPressed: () {},
        ),
      ));

      expect(find.byIcon(Icons.bookmark), findsOneWidget);
    });
    testWidgets('Bookmark button test unpressed', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(WidgetTesting(
        child: BookmarkButton(
          isBookmark: false,
          onPressed: () {},
        ),
      ));

      expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
    });
  });
}
