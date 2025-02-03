import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/news_provider.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Haberler")),
      body: newsAsyncValue.when(
        data: (newsList) => ListView.builder(
          itemCount: newsList.articles.length,
          itemBuilder: (context, index) {
            final news = newsList.articles[index];
            return ListTile(
              title: Text(news.title),
              subtitle: Text(news.description ?? ""),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text("Hata oluştu: ${error.toString()}")),
      ),
    );
  }
}
