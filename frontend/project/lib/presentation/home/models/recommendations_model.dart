import 'package:json_annotation/json_annotation.dart';

part 'recommendations_model.g.dart';

@JsonSerializable()
class RecommendationsModel {
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final String thumbnails; // Updated type for thumbnails
  final String channelTitle;
  final String liveBroadcastContent;
  final String publishTime;

  RecommendationsModel({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationsModelToJson(this);
}
