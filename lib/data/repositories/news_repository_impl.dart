import 'package:galleria/data/datasources/local/news_local_data_source.dart';
import 'package:galleria/data/datasources/remote/news_remote_data_source.dart';
import 'package:galleria/data/models/news_model.dart';
import 'package:galleria/domain/entities/news.dart';
import 'package:galleria/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<News> getTopHeadlines() async {
    try {
      final NewsModel newsResponseModel = await remoteDataSource.fetchTopHeadlines();

      // Save to local database
      await localDataSource.saveNews(newsResponseModel.articles);

      return newsResponseModel.toEntity();
    } catch (e) {
      // If API fails, return saved news from local DB
      final cachedNews = await localDataSource.getSavedNews();
      return News(
        status: "cached",
        totalResults: cachedNews.length,
        articles: cachedNews.map((article) => article.toEntity()).toList(),
      );
    }
  }
}
