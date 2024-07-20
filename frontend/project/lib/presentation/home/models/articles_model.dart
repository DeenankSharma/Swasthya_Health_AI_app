import 'package:json_annotation/json_annotation.dart';
part 'articles_model.g.dart';

@JsonSerializable()
class ArticlesModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  ArticlesModel({
    this.author = 'Author',  // Provide default value
    this.title = 'Title',   // Provide default value
    this.description = 'Description', // Provide default value
    this.url = 'Link',     // Provide default value
    this.urlToImage = 'Failed to display Image', // Provide default value
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);
}
