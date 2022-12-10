import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/prefecture_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

const _title = 'Full-text search with Flutter and Firestore';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        dividerTheme: const DividerThemeData(space: 0),
      ),
      home: const PrefecturePage(title: _title),
    );
  }
}
