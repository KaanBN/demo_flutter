import 'package:galleria/data/datasources/local/news_local_data_source.dart';
import 'package:galleria/data/datasources/remote/news_remote_data_source.dart';
import 'package:galleria/data/models/article_model.dart';
import 'package:galleria/data/models/news_model.dart';
import 'package:galleria/domain/entities/article.dart';
import 'package:galleria/domain/repositories/news_repository.dart';
import 'package:galleria/data/models/source_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<Article>> getTopHeadlines() async {
    try {
      final NewsModel newsResponseModel = await remoteDataSource.fetchTopHeadlines();

      // Save to local database
      await localDataSource.saveArticles(newsResponseModel.articles);

      return newsResponseModel.articles.map((e) => e.toEntity()).toList();
    } catch (e) {
      // If API fails, return saved news from local DB
      final cachedArticles = await localDataSource.getSavedArticles();
      return cachedArticles.map((e) => e.toEntity()).toList();
    }
  }

  @override
  Future<void> saveArticles(List<Article> articles) async {
    final articleModels = articles.map((e) => ArticleModel(
      source: SourceModel(id: e.source.id, name: e.source.name),
      author: e.author,
      title: e.title,
      description: e.description,
      url: e.url,
      urlToImage: e.urlToImage,
      publishedAt: e.publishedAt,
      content: e.content,
    )).toList();

    await localDataSource.saveArticles(articleModels);
  }

  @override
  Future<List<Article>> getSavedArticles() async {
    final savedArticles = await localDataSource.getSavedArticles();
    return savedArticles.map((e) => e.toEntity()).toList();
  }
}
