import 'package:flutter/material.dart';
import 'package:galleria/domain/entities/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(

    );
    /*return ListTile(
      title: Text(article.title),
      subtitle: Text(article.description ?? ""),
      leading: Image.network(
        article.urlToImage ?? "",
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    );*/
  }
}
