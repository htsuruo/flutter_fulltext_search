import 'package:flutter/material.dart';
import 'package:flutter_fulltext_search/prefecture_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

const _title = 'Full-text search with Flutter and Firestore';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        dividerTheme: const DividerThemeData(space: 0),
      ),
      home: const PrefecturePage(title: _title),
    );
  }
}

// class _HomePage extends StatelessWidget {
//   const _HomePage();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(_title),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: const Text('Algolia'),
//             subtitle: const Text('Search with Algolia Made by Algolia'),
//             trailing: const _LaunchIconButton(
//               url:
//                   'https://extensions.dev/extensions/algolia/firestore-algolia-search',
//             ),
//             onTap: () {
//               Navigator.of(context).push<void>(
//                 MaterialPageRoute(builder: (context) => const AlgoliaPage()),
//               );
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text('Meilisearch'),
//             subtitle: const Text('Search with Meilisearch Made by Meilisearch'),
//             trailing: const _LaunchIconButton(
//               url:
//                   'https://extensions.dev/extensions/meilisearch/firestore-meilisearch',
//             ),
//             onTap: () {
//               Navigator.of(context).push<void>(
//                 MaterialPageRoute(
//                   builder: (context) => const MeilisearchPage(),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

// class _LaunchIconButton extends StatelessWidget {
//   const _LaunchIconButton({required this.url});

//   final String url;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;
//     return IconButton(
//       icon: Icon(
//         Icons.open_in_browser_outlined,
//         color: colorScheme.primary,
//       ),
//       onPressed: () => launchUrl(
//         Uri.parse(url),
//       ),
//     );
//   }
// }
