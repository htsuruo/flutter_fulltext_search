import 'package:algolia/algolia.dart';
import 'package:flutter_fulltext_search/logger.dart';
import 'package:flutter_fulltext_search/prefecture.dart';
import 'package:flutter_fulltext_search/secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_bar/search_bar_provider.dart';

const _algolia = Algolia.init(
  applicationId: Secret.algoliaApplicationId,
  apiKey: Secret.algoliaApiKey,
);

final searchProvider = FutureProvider<List<Prefecture>>((ref) async {
  final word = ref.watch(searchBarProvider);
  final query = _algolia.instance.index('prefectures_index').query(word);
  final snapshot = await query.getObjects();
  logger.info('Hit count: ${snapshot.nbHits}');
  return snapshot.hits.map((hit) => Prefecture.fromJson(hit.data)).toList();
});
