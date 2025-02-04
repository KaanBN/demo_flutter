import 'package:galleria/core/constants/api_keys.dart';
import 'package:galleria/core/network/api_client.dart';
import 'package:galleria/data/models/news_model.dart';

class NewsRemoteDataSource {
  final ApiClient apiClient;

  NewsRemoteDataSource({required this.apiClient});

  /// Fetch top headlines from API
  Future<NewsModel> fetchTopHeadlines() async {
    try {
      final response = await apiClient.get("/top-headlines", queryParams: {
        "country": "us",
        "apiKey": ApiKeys.newsApiKey,
      });

      if (response.statusCode == 200) {
        return NewsModel.fromJson(response.data);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch news: $e");
    }
  }
}
