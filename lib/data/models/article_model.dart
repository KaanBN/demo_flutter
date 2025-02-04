import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/article.dart';
import 'source_model.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0) // Hive için type ID ekledik
@JsonSerializable()
class ArticleModel {
  @HiveField(0) // Hive için field index
  @JsonKey(name: "source")
  final SourceModel source;

  @HiveField(1)
  @JsonKey(name: "author")
  final String? author;

  @HiveField(2)
  @JsonKey(name: "title")
  final String title;

  @HiveField(3)
  @JsonKey(name: "description")
  final String? description;

  @HiveField(4)
  @JsonKey(name: "url")
  final String url;

  @HiveField(5)
  @JsonKey(name: "urlToImage")
  final String? urlToImage;

  @HiveField(6)
  @JsonKey(name: "publishedAt")
  final DateTime publishedAt;

  @HiveField(7)
  @JsonKey(name: "content")
  final String? content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  /// Converts `ArticleModel` to `Article` Entity
  Article toEntity() {
    return Article(
      source: source.toEntity(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
