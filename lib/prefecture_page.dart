import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_bar/search_bar.dart';

class PrefecturePage extends ConsumerWidget {
  const PrefecturePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: SearchBar(),
          ),
          Expanded(
            child: ref.watch(searchProvider).when(
                  error: (error, stackTrace) =>
                      Center(child: Text('error: ${error.toString()}')),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  data: (prefectures) {
                    return ListView.builder(
                      itemCount: prefectures.length,
                      itemBuilder: (context, index) {
                        final prefecture = prefectures[index];
                        return ListTile(
                          title: Text(prefecture.name),
                          subtitle: Text(
                            '${prefecture.hiragana} / ${prefecture.roman}',
                          ),
                          trailing: Text(prefecture.objectId),
                        );
                      },
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
