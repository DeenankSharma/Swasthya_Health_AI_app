// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesModel _$ArticlesModelFromJson(Map<String, dynamic> json) =>
    ArticlesModel(
      author: json['author'] as String? ?? 'Author',
      title: json['title'] as String? ?? 'Title',
      description: json['description'] as String? ?? 'Description',
      url: json['url'] as String? ?? 'Link',
      urlToImage: json['urlToImage'] as String? ?? 'Failed to display Image',
    );

Map<String, dynamic> _$ArticlesModelToJson(ArticlesModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
    };
