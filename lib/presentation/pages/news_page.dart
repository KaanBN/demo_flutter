import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/presentation/state/news_provider.dart';
import 'package:galleria/presentation/widgets/article_card.dart';

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
            return ArticleCard(article: articlesList[index]);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hata oluştu!"),
                const SizedBox(height: 10),
                Text(error.toString(), style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => ref.refresh(newsProvider),
                  child: const Text("Tekrar Dene"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
