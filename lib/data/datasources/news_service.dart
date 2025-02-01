import 'package:galleria/core/network/api_client.dart';

class NewsService {
  final ApiClient apiClient;

  NewsService({required this.apiClient});

  /// Fetch top headlines from API
  Future<List<NewsModel>>
}