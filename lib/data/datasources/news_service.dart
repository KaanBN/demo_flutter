import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_keys.dart';
import '../models/news_model.dart';

class NewsService {
  final String _baseUrl = "https://newsapi.org/v2";

  Future<List<NewsModel>> fetchTopHeadlines() async {
    final url = Uri.parse("$_baseUrl/top-headlines?country=us&apiKey=${ApiKeys.newsApiKey}");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (data['status'] == 'ok') {
        List<dynamic> articles = data['articles'];
        return articles.map((article) => NewsModel.fromJson(article)).toList();
      } else {
        throw Exception("API'den geçersiz yanıt alındı.");
      }
    } else {
      throw Exception("Haberleri çekerken hata oluştu: ${response.statusCode}");
    }
  }
}
