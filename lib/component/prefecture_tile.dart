import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/prefecture.dart';

class PrefectureTile extends StatelessWidget {
  const PrefectureTile({super.key, required this.prefecture});

  final Prefecture prefecture;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(prefecture.name),
      subtitle: Text(
        '${prefecture.hiragana} / ${prefecture.roman}',
      ),
      // trailing: Text(prefecture.objectId),
    );
  }
}
