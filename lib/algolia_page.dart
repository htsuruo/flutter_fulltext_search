import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/component/prefecture_tile.dart';
import 'package:flutter_fulltext_search/component/search_count_text.dart';
import 'package:flutter_fulltext_search/secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'component/search_bar/search_bar.dart';
import 'component/search_bar/search_bar_provider.dart';
import 'prefecture.dart';

const _algolia = Algolia.init(
  applicationId: Secret.algoliaApplicationId,
  apiKey: Secret.algoliaApiKey,
);

final _searchProvider = FutureProvider<AlgoliaQuerySnapshot>((ref) {
  final word = ref.watch(searchBarProvider);
  final query = _algolia.instance.index('prefectures_index').query(word);
  return query.getObjects();
});

final _searchCountProvider = FutureProvider<int?>(
  (ref) => ref.watch(_searchProvider.future).then((s) => s.nbHits),
);

class AlgoliaPage extends ConsumerWidget {
  const AlgoliaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const horizontalPadding = EdgeInsets.symmetric(horizontal: 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algolia'),
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
                    data: (snapshot) {
                      final hits = snapshot.hits;
                      if (hits.isEmpty) {
                        return const Text('Not Found');
                      }
                      final prefectures = snapshot.hits
                          .map((hit) => Prefecture.fromJson(hit.data))
                          .toList();
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
