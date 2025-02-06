import 'package:galleria/domain/entities/article.dart';
import 'package:galleria/domain/repositories/news_repository.dart';

class SaveNewsUseCase {
  final NewsRepository repository;

  SaveNewsUseCase(this.repository);

  Future<void> call(List<Article> articles) async {
    return await repository.saveArticles(articles);
  }
}
