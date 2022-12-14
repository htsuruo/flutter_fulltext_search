import 'package:algolia/algolia.dart';
import 'package:flutter_fulltext_search/logger.dart';
import 'package:flutter_fulltext_search/prefecture.dart';
import 'package:flutter_fulltext_search/secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meilisearch/meilisearch.dart';

import 'search_bar/search_bar_provider.dart';

final searchProvider = FutureProvider<List<Prefecture>>(
  (ref) => throw UnimplementedError(),
);

const _algolia = Algolia.init(
  applicationId: Secret.algoliaApplicationId,
  apiKey: Secret.algoliaApiKey,
);

final algoliaProvider = FutureProvider<List<Prefecture>>((ref) async {
  final word = ref.watch(searchBarProvider);
  final query = _algolia.instance.index('prefectures_index').query(word);
  final snapshot = await query.getObjects();
  logger.info('Hit count: ${snapshot.nbHits}');
  return snapshot.hits.map((hit) => Prefecture.fromJson(hit.data)).toList();
});

final _meilisearchClient = MeiliSearchClient(
  'http://34.84.205.58',
  Secret.meilisearchApiKey,
);

final meilisearchProvider = FutureProvider<List<Prefecture>>((ref) async {
  final index = _meilisearchClient.index('prefectures');
  final result = await index.search('');
  return result.hits!.map(Prefecture.fromJson).toList();
});
