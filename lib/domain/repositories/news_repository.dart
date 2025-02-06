import 'package:galleria/domain/entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopHeadlines();

  Future<void> saveArticles(List<Article> articles);

  Future<List<Article>> getSavedArticles();
}