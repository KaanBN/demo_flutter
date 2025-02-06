import 'package:galleria/data/models/article_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewsLocalDataSource {
  final Box<ArticleModel> articleBox;

  NewsLocalDataSource({required this.articleBox});

  /// Open the box if it's not already opened
  static Future<NewsLocalDataSource> create() async {
    final box = await Hive.openBox<ArticleModel>('articleBox');
    return NewsLocalDataSource(articleBox: box);
  }

  /// Save news to local database
  Future<void> saveArticles(List<ArticleModel> articleList) async {
    await articleBox.clear(); // Delete old data
    await articleBox.addAll(articleList);
  }

  /// Get saved news from local database
  Future<List<ArticleModel>> getSavedArticles() async {
    return articleBox.values.toList();
  }
}
