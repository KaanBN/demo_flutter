import 'package:galleria/domain/entities/article.dart';
import 'package:galleria/domain/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<List<Article>> call() async {
    return await repository.getTopHeadlines();
  }
}
