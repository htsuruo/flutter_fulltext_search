# Flutter Full-Text Search

Full-text search playground with Flutter and Firestore.

| DEMO |
| --- |
| ![search_result_with_dart_sdk](https://user-images.githubusercontent.com/12729025/207903036-9ec42d1f-fec7-47bf-99f8-c317af4065aa.gif) |

## Getting Started

APIキーを参照するため、以下の `env.dart` を作成し `\lib` に配置してください（.gitignore対象です）。

```dart: env.dart
abstract class Env {
  static const algoliaApplicationId = '[YOUR_ALGOLIA_APPLICATION_ID]';
  static const algoliaApiKey = '[YOUR_ALGOLIA_API_KEY]';
  static const meilisearchHost = '[YOUR_MEILISEARCH_HOST]';
  static const meilisearchApiKey = '[YOUR_MEILISEARCH_API_KEY]';
}
```

## Meilisearch
本レポジトリのMeilisearchは自前デプロイ前提のため、動作させるには別途デプロイ作業が必要です。

[Quick start | Meilisearch Documentation v0.30](https://docs.meilisearch.com/learn/getting_started/quick_start.html#setup-and-installation)