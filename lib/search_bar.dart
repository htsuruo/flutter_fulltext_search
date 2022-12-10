import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_bar_provider.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final controller = ref.watch(searchBarProvider.notifier);
    return Form(
      key: controller.formGlobalKey,
      child: TextFormField(
        controller: controller.searchTextController,
        autocorrect: false,
        onFieldSubmitted: (_) {
          controller.search();
        },
        // `formGlobalKey`のvalidatorを機能させるための指定。
        // 後述の`errorStyle`のコメント参照。
        validator: (value) => value == null || value.isEmpty ? '' : null,
        style: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          hintText: 'Please input some search keyword',
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: Colors.grey,
          ),
          // validatorは機能させたいが、エラーメッセージとしては不要なので隠す処理
          // 現状validatorはエラーメッセージと密に結合されていて引き剥がせないための措置。
          // ref. https://stackoverflow.com/a/60024914
          errorStyle: const TextStyle(fontSize: 0),
          filled: true,
          fillColor: colorScheme.primary.withOpacity(.1),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
