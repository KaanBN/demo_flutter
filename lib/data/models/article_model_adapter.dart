import 'package:galleria/data/models/source_model.dart';
import 'package:hive/hive.dart';
import 'article_model.dart';

class ArticleModelAdapter extends TypeAdapter<ArticleModel> {
  @override
  final int typeId = 0; // Hive için benzersiz bir ID

  @override
  ArticleModel read(BinaryReader reader) {
    return ArticleModel(
      source: SourceModel(
        id: reader.read(),
        name: reader.read(),
      ),
      author: reader.read(),
      title: reader.read(),
      description: reader.read(),
      url: reader.read(),
      urlToImage: reader.read(),
      publishedAt: DateTime.parse(reader.read()),
      content: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticleModel obj) {
    writer.write(obj.source.id);
    writer.write(obj.source.name);
    writer.write(obj.author);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.url);
    writer.write(obj.urlToImage);
    writer.write(obj.publishedAt.toIso8601String());
    writer.write(obj.content);
  }
}
