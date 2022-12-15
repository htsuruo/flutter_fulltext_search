import 'package:flutter/material.dart';

class SearchCountText extends StatelessWidget {
  const SearchCountText({super.key, required this.count});

  final int? count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '検索ヒット数: ${count ?? '---'}件',
      style: theme.textTheme.bodySmall,
    );
  }
}
