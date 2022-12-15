import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/component/prefecture_tile.dart';
import 'package:flutter_fulltext_search/component/search_count_text.dart';
import 'package:flutter_fulltext_search/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:meilisearch/meilisearch.dart';

import 'component/search_bar/search_bar.dart';
import 'component/search_bar/search_bar_provider.dart';
import 'prefecture.dart';

final _meilisearchClient = MeiliSearchClient(
  Env.meilisearchHost,
  Env.meilisearchApiKey,
);

final _searchProvider = FutureProvider<SearchResult>((ref) {
  final word = ref.watch(searchBarProvider);
  final index = _meilisearchClient.index('prefectures');
  return index.search(word);
});

final _searchCountProvider = FutureProvider<int?>(
  (ref) => ref.watch(_searchProvider.future).then((s) => s.estimatedTotalHits),
);

class MeilisearchPage extends ConsumerWidget {
  const MeilisearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const horizontalPadding = EdgeInsets.symmetric(horizontal: 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meilisearch'),
      ),
      body: Column(
        children: [
          const Gap(16),
          const Padding(
            padding: horizontalPadding,
            child: SearchBar(),
          ),
          const Gap(8),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: horizontalPadding,
              child: SearchCountText(
                count: ref.watch(_searchCountProvider).valueOrNull,
              ),
            ),
          ),
          const Gap(8),
          const Divider(),
          Expanded(
            child: Center(
              child: ref.watch(_searchProvider).when(
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: CircularProgressIndicator.new,
                    data: (result) {
                      final hits = result.hits;
                      if (hits == null || hits.isEmpty) {
                        return const Text('Not Found');
                      }
                      final prefectures =
                          hits.map(Prefecture.fromJson).toList();
                      return ListView.builder(
                        itemCount: prefectures.length,
                        itemBuilder: (context, index) {
                          return PrefectureTile(prefecture: prefectures[index]);
                        },
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
