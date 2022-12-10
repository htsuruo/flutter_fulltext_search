import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchBarProvider = NotifierProvider<SearchBarNotifier, String>(
  SearchBarNotifier.new,
);

const _initialQuery = 'flutter';

class SearchBarNotifier extends Notifier<String> {
  @override
  String build() {
    searchTextController.text = _initialQuery;
    return _initialQuery;
  }

  final formGlobalKey = GlobalKey<FormState>();
  final searchTextController = TextEditingController();

  void search() {
    if (formGlobalKey.currentState!.validate()) {
      final inputText = searchTextController.text;
      logger.info('search: $inputText');
      state = inputText;
    }
  }
}
