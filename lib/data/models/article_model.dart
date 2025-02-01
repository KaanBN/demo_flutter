import 'package:galleria/data/models/source_model.dart';
import 'package:galleria/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: "source")
  SourceModel source;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  DateTime publishedAt;
  @JsonKey(name: "content")
  String? content;

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

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

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