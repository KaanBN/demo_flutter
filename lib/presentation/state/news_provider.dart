import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/domain/entities/news.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../domain/repositories/news_repository.dart';
import '../../data/datasources/news_service.dart';
import '../../core/network/api_client.dart';

/// Provides the `ApiClient` instance
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

/// Provides the `NewsService` instance, which needs `ApiClient`
final newsServiceProvider = Provider<NewsService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return NewsService(apiClient: apiClient);
});

/// Provides the `NewsRepositoryImpl` instance, which needs `NewsService`
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final newsService = ref.read(newsServiceProvider);
  return NewsRepositoryImpl(newsService: newsService);
});

/// Fetches top headlines using the repository
final newsProvider = FutureProvider<News>((ref) async {
  final repository = ref.read(newsRepositoryProvider);
  return repository.getTopHeadlines();
});
