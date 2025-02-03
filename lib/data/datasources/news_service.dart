import 'package:galleria/core/network/api_client.dart';

import '../../core/constants/api_keys.dart';
import '../models/news_model.dart';

class NewsService {
  final ApiClient apiClient;

  NewsService({required this.apiClient});

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
    }
    catch (e) {
      print(e);
      throw Exception("Failed to fetch top headlines: $e");
    }
  }
}