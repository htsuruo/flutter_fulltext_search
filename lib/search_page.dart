import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: SearchBar(),
          )
        ],
      ),
    );
  }
}
