import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/news_service.dart';
import '../../data/models/news_model.dart';

final newsServiceProvider = Provider<NewsService>((ref) => NewsService());

final newsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final newsService = ref.read(newsServiceProvider);
  return newsService.fetchTopHeadlines();
});