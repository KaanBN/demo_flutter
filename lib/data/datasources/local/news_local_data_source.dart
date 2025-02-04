import 'package:galleria/data/models/article_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewsLocalDataSource {
  final Box<ArticleModel> newsBox;

  NewsLocalDataSource({required this.newsBox});

  /// Open the box if it's not already opened
  static Future<NewsLocalDataSource> create() async {
    final box = await Hive.openBox<ArticleModel>('newsBox');
    return NewsLocalDataSource(newsBox: box);
  }

  /// Save news to local database
  Future<void> saveNews(List<ArticleModel> newsList) async {
    await newsBox.clear(); // Delete old data
    await newsBox.addAll(newsList);
  }

  /// Get saved news from local database
  Future<List<ArticleModel>> getSavedNews() async {
    return newsBox.values.toList();
  }
}
