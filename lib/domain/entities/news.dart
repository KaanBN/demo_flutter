import 'article.dart';

class News {
  final String status;
  final int totalResults;
  final List<Article> articles;

  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}