// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationsModel _$RecommendationsModelFromJson(
        Map<String, dynamic> json) =>
    RecommendationsModel(
      publishedAt: json['publishedAt'] as String,
      channelId: json['channelId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnails: json['thumbnails'] as String,
      channelTitle: json['channelTitle'] as String,
      liveBroadcastContent: json['liveBroadcastContent'] as String,
      publishTime: json['publishTime'] as String,
    );

Map<String, dynamic> _$RecommendationsModelToJson(
        RecommendationsModel instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'channelTitle': instance.channelTitle,
      'liveBroadcastContent': instance.liveBroadcastContent,
      'publishTime': instance.publishTime,
    };
