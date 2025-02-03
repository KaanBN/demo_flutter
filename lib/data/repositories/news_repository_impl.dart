import 'package:galleria/data/datasources/news_service.dart';
import 'package:galleria/data/models/news_model.dart';
import 'package:galleria/domain/entities/news.dart';
import 'package:galleria/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  final NewsService newsService;

  NewsRepositoryImpl({required this.newsService});

  @override
  Future<News> getTopHeadlines() async {
    final NewsModel newsModel = await newsService.fetchTopHeadlines();

    return newsModel.toEntity();
  }

}