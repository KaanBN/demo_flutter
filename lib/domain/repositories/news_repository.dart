import 'package:galleria/domain/entities/news.dart';

abstract class NewsRepository {
  Future<News> getTopHeadlines();
}