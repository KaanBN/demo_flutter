import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/news_provider.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Güncel Haberler")),
      body: newsAsyncValue.when(
        data: (newsList) => ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final news = newsList[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: news.urlToImage != null
                    ? Image.network(news.urlToImage!, width: 80, fit: BoxFit.cover)
                    : null,
                title: Text(news.title ?? "Başlık Yok", style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(news.description ?? "Açıklama Yok"),
                onTap: () {
                  // Haberin detay sayfasına yönlendirme yapabiliriz.
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text("Hata oluştu: $error")),
      ),
    );
  }
}