import 'package:galleria/data/models/article_model.dart';
import 'package:galleria/domain/entities/news.dart';
import 'package:json_annotation/json_annotation.dart';


part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "totalResults")
  int totalResults;
  @JsonKey(name: "articles")
  List<ArticleModel> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  News toEntity() {
    return News(
      status: status,
      totalResults: totalResults,
      articles: articles.map((article) => article.toEntity()).toList(),
    );
  }
}