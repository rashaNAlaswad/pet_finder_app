import 'package:json_annotation/json_annotation.dart';

part 'post_favourite_response.g.dart';

@JsonSerializable()
class PostFavouriteResponse {
  final String message;
  final int id;

  PostFavouriteResponse({required this.message, required this.id});

  factory PostFavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$PostFavouriteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostFavouriteResponseToJson(this);
}
