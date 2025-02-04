import 'package:galleria/data/models/article_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewsLocalDataSource {
  final Box<ArticleModel> newsBox;

  NewsLocalDataSource({required this.newsBox});

  /// Save news to local database
  Future<void> saveNews(List<ArticleModel> newsList) async {
    await newsBox.clear();
    await newsBox.addAll(newsList);
  }

  /// Get saved news from local database
  Future<List<ArticleModel>> getSavedNews() async {
    return newsBox.values.toList();
  }
}
