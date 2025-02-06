import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/presentation/state/news_provider.dart';


class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Haberler")),
      body: newsAsyncValue.when(
        data: (articlesList) => ListView.builder(
          itemCount: articlesList.length,
          itemBuilder: (context, index) {
            final news = articlesList[index];
            return ListTile(
              title: Text(news.title),
              subtitle: Text(news.description ?? ""),
              leading: Image.network(
                news.urlToImage ?? "",
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text("Hata oluştu: ${error.toString()}")),
      ),
    );
  }
}
