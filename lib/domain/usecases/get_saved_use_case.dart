import 'package:galleria/domain/entities/article.dart';

import '../repositories/news_repository.dart';

class GetSavedNewsUseCase {
  final NewsRepository repository;

  GetSavedNewsUseCase(this.repository);

  Future<List<Article>> call() async {
    return await repository.getSavedArticles();
  }
}
